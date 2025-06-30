module Semantic where

import Ri
import Distribution.Compat.Lens (_1)
import Control.Monad (when, zipWithM)

-- Mônada criada : um valor do tipo 'a' e uma String para mensagens.
data SemanticM a = Sem (String, a) deriving Show

-- A instância de Functor nos permite aplicar uma função ao valor 'a'
-- sem mexer nas mensagens. Ex: fmap (+1) (Sem ("msg", 5)) == Sem ("msg", 6)
instance Functor SemanticM where
    fmap f (Sem (s, a)) = Sem (s, f a)

-- A instância de Applicative nos dá o 'pure' (coloca um valor dentro da Mônada
-- sem mensagens) e o operador '<*>' para aplicar uma função monádica a um
-- valor monádico, concatenando as mensagens.
instance Applicative SemanticM where
    pure a = Sem ("", a)
    Sem (s1, f) <*> Sem (s2, x) = Sem (s1 ++ s2, f x)

-- A instância de Monad permite encadear operações com '>>=' (bind).
-- Uma operação pode depender do resultado da anterior, e as mensagens são sempre acumuladas.
instance Monad SemanticM where
    (Sem (s1, a)) >>= f = let Sem (s2, b) = f a in Sem (s1 ++ s2, b)

-- Função auxiliar para registrar um erro.
erro :: String -> SemanticM ()
erro msg = Sem ("Erro: " ++ msg ++ "\n", ())

-- Função auxiliar para registrar um aviso.
adv :: String -> SemanticM ()
adv msg = Sem ("Aviso: " ++ msg ++ "\n", ())

-- O Ambiente de Análise: uma lista de todas as funções e uma lista das variáveis no escopo atual.
type Env = ([Funcao], [Var])

-- Busca uma variável no ambiente e retorna seu tipo.
buscarVar :: Id -> Env -> Maybe Tipo
buscarVar id (_, []) = Nothing -- Não achou na lista de variáveis
buscarVar id (funcoes, (var@(vId :#: (tipo, _))) : vs) =
    if id == vId
        then Just tipo
        else buscarVar id (funcoes, vs)

-- Busca uma função no ambiente e retorna sua assinatura completa.
buscarFuncao :: Id -> Env -> Maybe Funcao
buscarFuncao id ([], _) = Nothing -- Não achou na lista de funções
buscarFuncao id ((fun@(fId :->: _)) : fs, vars) =
    if id == fId
        then Just fun
        else buscarFuncao id (fs, vars)

--percorre a lista mantendo um registro dos nomes que ja foram visto
verificaDuplicatas :: (Eq a, Show a) => (b -> a) -> [b] -> SemanticM ()
verificaDuplicatas extrairNome lista = go lista []
  where
    -- 'go' é uma função auxiliar que faz o trabalho pesado.
    -- O primeiro argumento é a lista que falta verificar.
    -- O segundo argumento é a lista de nomes que já vimos.
    go [] _ = pure () -- Caso base: se a lista a verificar está vazia, terminamos sem erros.
    
    go (itemAtual : restoDaLista) nomesVistos = do
        let nomeAtual = extrairNome itemAtual

        -- Verifica se o nome extraído já está na lista de nomes vistos
        if nomeAtual `elem` nomesVistos
            -- Se já vimos, emite um erro e para.
            then erro ("Identificador duplicado encontrado: " ++ show nomeAtual)
            -- Se não, continua a verificação recursivamente.
            else go restoDaLista (nomeAtual : nomesVistos)
                -- Continua com o resto da lista...
                -- ...e adiciona o nome atual à lista de nomes vistos para as próximas verificações.

analisa :: Programa -> SemanticM Programa
analisa (Prog funcoesDefs funcoesCorpos varsGlobais blocoPrincipal) = do
    -- Passo 1: Verificar se há funções ou variáveis globais duplicadas.
    verificaDuplicatas (\(fId :->:_) -> fId) funcoesDefs
    verificaDuplicatas (\(vId :#: _) -> vId) varsGlobais
    
    -- Passo 2: Construir o ambiente inicial.
    -- Todas as funções são visíveis em todos os lugares.
    let envGlobal = (funcoesDefs, varsGlobais)

    -- Passo 3: Analisar o bloco principal do programa.
    -- O 'Nothing' indica que não estamos dentro de uma função (importante para o 'return').
    blocoPrincipal' <- analisaBloco envGlobal Nothing blocoPrincipal
    
    -- Passo 4: Analisar o corpo de cada função definida
    funcoesCorpos' <- mapM (analisaFuncaoCompleta envGlobal) funcoesCorpos
    
    -- Por enquanto, retornamos uma AST parcialmente processada.
    pure (Prog funcoesDefs funcoesCorpos' varsGlobais blocoPrincipal')



-- Analisa um bloco de comandos
analisaBloco :: Env -> Maybe Funcao -> Bloco -> SemanticM Bloco
analisaBloco _ _ [] = pure [] -- Bloco vazio está sempre correto.
analisaBloco env maybeFuncao (cmd:cmds) = do
    -- Analisa o primeiro comando
    cmd' <- analisaComando env maybeFuncao cmd
    -- Analisa o resto do bloco
    cmds' <- analisaBloco env maybeFuncao cmds
    -- Retorna o novo bloco com os comandos analisados
    pure (cmd' : cmds')

analisaFuncaoCompleta :: Env -> (Id, [Var], Bloco) -> SemanticM (Id, [Var], Bloco)
analisaFuncaoCompleta envGlobal (fId, locals, bloco) =
    -- Primeiro, encontramos a assinatura completa da função para obter seus parâmetros e tipo de retorno.
    case buscarFuncao fId envGlobal of
        Nothing -> do
            erro ("Erro interno: Corpo definido para função '" ++ fId ++ "' que não possui assinatura.")
            pure (fId, locals, bloco)

        Just (funcao@(_ :->: (params, _))) -> do
            -- 1. Verificar duplicatas entre parâmetros e variáveis locais.
            verificaDuplicatas (\(pId :#: _) -> pId) params
            verificaDuplicatas (\(vId :#: _) -> vId) locals
            let nomesParams = map (\(pId :#: _) -> pId) params
            mapM_ (\(lId :#: _) -> when (lId `elem` nomesParams) $
                                     erro ("Variável local '" ++ lId ++ "' tem o mesmo nome de um parâmetro na função '" ++ fId ++ "'.")) locals

            -- 2. Construir o ambiente LOCAL da função.
            let (funcoesGlobais, varsGlobais) = envGlobal
            let envLocal = (funcoesGlobais, params ++ locals ++ varsGlobais)

            -- 3. Analisar o bloco da função com o ambiente local.
            bloco' <- analisaBloco envLocal (Just funcao) bloco

            -- 4. Retorna a nova tupla representando o corpo da função analisada.
            pure (fId, locals, bloco')

-- | Analisa e aplica coerção de tipos para operadores binários (aritméticos e relacionais).
--   Retorna o tipo resultante e as novas sub-árvores (possivelmente com nós de coerção).
analisaOperandosCoerciveis :: Env -> Expr -> Expr -> SemanticM (Tipo, Expr, Expr)
analisaOperandosCoerciveis env e1 e2 = do
    (tipo1, novaE1) <- analisaExpr env e1
    (tipo2, novaE2) <- analisaExpr env e2

    case (tipo1, tipo2) of
        -- Caso 1: Tipos já são iguais e numéricos. Nenhum trabalho a fazer.
        (TInt, TInt)       -> pure (TInt,    novaE1, novaE2)
        (TDouble, TDouble) -> pure (TDouble, novaE1, novaE2)

        -- Caso 2: Promoção de Int para Double. O tipo resultante é Double.
        (TInt, TDouble) -> pure (TDouble, IntDouble novaE1, novaE2)
        (TDouble, TInt) -> pure (TDouble, novaE1, IntDouble novaE2)

        -- Caso 3: Operandos não numéricos ou erros prévios.
        -- Se um dos tipos for TVoid, um erro já foi emitido. Apenas propagamos.
        _ | tipo1 == TString || tipo2 == TString -> do
            erro ("Operação numérica inválida com o tipo String.")
            pure (TVoid, novaE1, novaE2)
        _ | tipo1 == TVoid || tipo2 == TVoid -> pure (TVoid, novaE1, novaE2)

        -- Caso 4: Outros tipos incompatíveis.
        _ -> do
            erro ("Tipos incompatíveis para operação: " ++ show tipo1 ++ " e " ++ show tipo2)
            pure (TVoid, novaE1, novaE2)

-- Analisa um único comando
analisaComando :: Env -> Maybe Funcao -> Comando -> SemanticM Comando
analisaComando env maybeFuncao cmd = case cmd of
    
    -- comando print(expr)
    Imp expr -> do
        -- adv "Comando 'print' encontrado."
        (_, expr') <- analisaExpr env expr
        -- Retorna o comando Imp com a expressão analisada.
        pure (Imp expr')
    
    -- Comando 'id = expr;'
    Atrib id expr -> do
        (tipoExpr, expr') <- analisaExpr env expr
        case buscarVar id env of
            Nothing -> do
                erro ("Variável de atribuição '" ++ id ++ "' não declarada.")
                pure (Atrib id expr')
 
            Just tipoVar -> do
                -- Se a expressão já resultou em erro, não fazemos mais nada.
                if tipoExpr == TVoid then
                    pure (Atrib id expr')
                else case (tipoVar, tipoExpr) of
                    -- Caso 1: Tipos são idênticos. Atribuição válida.
                    (TDouble, TDouble) -> pure (Atrib id expr')
                    (TInt, TInt)       -> pure (Atrib id expr')
                    (TString, TString) -> pure (Atrib id expr')

                    -- Caso 2: Promoção (int -> double). Válido.
                    (TDouble, TInt) -> pure (Atrib id (IntDouble expr'))

                    -- Caso 3: Rebaixamento (double -> int). Válido, mas com aviso.
                    (TInt, TDouble) -> do
                        adv ("Atribuição de Double para Int na variável '" ++ id ++ "'. Pode haver perda de precisão.")
                        pure (Atrib id (DoubleInt expr'))
                    
                    -- Caso 4: Todos os outros são erros de tipo.
                    _ -> do
                        erro ("Erro de tipo na atribuição para '" ++ id ++ "'. Esperado " ++ show tipoVar ++ " mas obteve " ++ show tipoExpr ++ ".")
                        pure (Atrib id expr')


    -- Chamada de um procedimento (função que não retorna valor)
    Proc id args -> case buscarFuncao id env of
        Nothing -> do
            erro ("Procedimento '" ++ id ++ "' não declarado.")
            pure (Proc id args)

        Just (_ :->: (params, tipoRetorno)) -> do
            when (tipoRetorno /= TVoid) $
                adv ("Função '" ++ id ++ "' que retorna " ++ show tipoRetorno ++ " está sendo chamada como um procedimento. O valor de retorno será descartado.")
            
            -- Mesma lógica da Chamada de função
            novosArgs <- analisaArgumentos env params args
            pure (Proc id novosArgs)


    If cond blocoThen blocoElse -> do
        -- Analisamos a condicao, que deve ser uma expressao logica, exemplo (12 == 90)
        cond' <- analisaExprL env cond

        -- Analisamos os blocos de comandos como de costume
        blocoThen' <- analisaBloco env maybeFuncao blocoThen
        blocoElse' <- analisaBloco env maybeFuncao blocoElse

        -- Retorna o comando If com a condição e os blocos analisados
        pure (If cond' blocoThen' blocoElse')

    While cond bloco -> do
        -- Mesma lógica do If
        cond' <- analisaExprL env cond
        bloco' <- analisaBloco env maybeFuncao bloco
        pure (While cond' bloco')


    Ret maybeExpr -> case maybeFuncao of
        Nothing -> do
            erro "Comando de retorno ('Ret') encontrado fora de uma função."
            case maybeExpr of
                Just expr -> Ret . Just . snd <$> analisaExpr env expr
                Nothing   -> pure (Ret Nothing)
            
        Just (_ :->: (_, tipoRetornoEsperado)) -> do
            case (maybeExpr, tipoRetornoEsperado) of
                -- Caso 1: `return expr;` em uma função que espera um valor.
                (Just expr, tipoRetornoEsperado) | tipoRetornoEsperado /= TVoid -> do
                    (tipoExprRetornada, expr') <- analisaExpr env expr
                    if tipoExprRetornada == TVoid then
                        pure (Ret (Just expr')) -- Erro já emitido, apenas propaga
                    else case (tipoRetornoEsperado, tipoExprRetornada) of
                        (TDouble, TDouble) -> pure (Ret (Just expr'))
                        (TInt, TInt)       -> pure (Ret (Just expr'))
                        (TString, TString) -> pure (Ret (Just expr'))
                        (TDouble, TInt)    -> pure (Ret (Just (IntDouble expr')))
                        (TInt, TDouble)    -> do
                            adv "Retorno de Double em uma função que espera Int. Pode haver perda de precisão."
                            pure (Ret (Just (DoubleInt expr')))
                        _ -> do
                            erro ("Tipo de retorno incorreto. Esperado " ++ show tipoRetornoEsperado ++ " mas a função retorna " ++ show tipoExprRetornada ++ ".")
                            pure (Ret (Just expr'))
    _ -> pure cmd


-- | Analisa e aplica coerção aos argumentos de uma chamada de função.
analisaArgumentos :: Env -> [Var] -> [Expr] -> SemanticM [Expr]
analisaArgumentos env params args = do
    -- Primeiro, verifica a aridade
    if length args /= length params then do
        erro ("Número incorreto de argumentos. Esperado: " ++ show (length params) ++ ", fornecido: " ++ show (length args) ++ ".")
        -- Analisa os argumentos mesmo assim para encontrar outros erros
        mapM (fmap snd . analisaExpr env) args
    else do
        -- 'zipWithM' itera sobre argumentos e parâmetros, aplicando a análise a cada par.
        let analisaPar p a = analisaComando env Nothing (Atrib (getId p) a) >>= \(Atrib _ a') -> pure a'
              where getId (id :#: _) = id
        
        -- Truque inteligente: Reutilizamos a lógica de 'Atrib' para fazer a coerção!
        -- Criamos um ambiente temporário apenas com o parâmetro e "atribuímos" o argumento a ele.
        zipWithM (\p a -> analisaComando ([], [p]) Nothing (Atrib (getId p) a) >>= \(Atrib _ a') -> pure a') params args
          where getId (id :#: _) = id

analisaExprAritmetica :: Env -> (Expr -> Expr -> Expr) -> Expr -> Expr -> SemanticM (Tipo, Expr)
analisaExprAritmetica env construtor e1 e2 = do
    (tipoResultante, e1', e2') <- analisaOperandosCoerciveis env e1 e2
    pure (tipoResultante, construtor e1' e2')

-- Analisa uma expressão
analisaExpr :: Env ->  Expr -> SemanticM (Tipo, Expr)
analisaExpr env expr = case expr of
    
    -- CASOS BASE (Sem recursão) ABAIXO:

    -- Se for uma constante, retornamos o tipo e a expressão.
    Const (CInt n) -> do
        -- Qual o tipo de um inteiro?
        -- A AST precisa ser modificada? Não.
        -- Use 'pure' para retornar o resultado.
        pure (TInt, Const (CInt n))

    -- Ex: 12.2123
    Const (CDouble d) -> do
        -- Qual o tipo de um double?
        -- A AST precisa ser modificada? Não.
        -- Use 'pure' para retornar o resultado.
        pure (TDouble, Const (CDouble d))

    -- Um literal string como "jose lindo"
    Lit s -> do
        pure(TString, Lit s)

    
    -- varaivel tipo 'contador'
    IdVar id -> case buscarVar id env of
        Just tipo -> pure (tipo, IdVar id)
        Nothing -> do
            erro("Variavel '" ++ id ++ "' não declarada.")
            pure(TVoid, IdVar id) -- Retorna TVoid em caso de erro

    -- CASOS RECURSIVOS
    Neg e -> do
        -- 1. Analise recursiva da expressão 'e'
        (tipoSubExpr, novaSubExpr) <- analisaExpr env e

        -- 2. Verifica se o tipo é compatível com a negação (so nao é valida se for string)
        if tipoSubExpr == TString
            then do
                erro("Não se pode negar uma expressão do tipo String.")
                pure (TVoid, Neg novaSubExpr) -- Retorna TVoid em caso de erro
            else
                -- 3. Retorna o tipo e a nova expressão (Negar um Double retorna um double)
                pure (tipoSubExpr, Neg novaSubExpr)


    Add e1 e2 -> analisaExprAritmetica env Add e1 e2
    Sub e1 e2 -> analisaExprAritmetica env Sub e1 e2
    Mul e1 e2 -> analisaExprAritmetica env Mul e1 e2
    Div e1 e2 -> analisaExprAritmetica env Div e1 e2
    
    -- Chamada de função como 'f(a,b)'
    Chamada id args -> case buscarFuncao id env of
        Nothing -> do
            erro ("Função '" ++ id ++ "' não declarada.")
            pure (TVoid, Chamada id args)

        Just (_ :->: (params, tipoRetorno)) -> do
            -- A nova função cuida de tudo: aridade, tipos e coerção.
            novosArgs <- analisaArgumentos env params args
            pure (tipoRetorno, Chamada id novosArgs)

    
    _ -> pure(TVoid, expr) -- placeholder generico



-- analisaExprRelacionalBinaria: Esta função encapsula a lógica comum para todas as expressões relacionais binárias.
-- Ela recebe:
--   - O ambiente 'env'.
--   - O construtor da expressão relacional (uma função como Req, Rdf, etc.).
--   - As duas sub-expressões e1 e e2.
analisaExprRelacionalBinaria :: Env -> (Expr -> Expr -> ExprR) -> Expr -> Expr -> SemanticM ExprR
analisaExprRelacionalBinaria env construtor e1 e2 = do
    -- A lógica é a mesma, mas ignoramos o tipo resultante, pois o resultado de uma relação é sempre lógico.
    (_, e1', e2') <- analisaOperandosCoerciveis env e1 e2
    pure (construtor e1' e2')

analisaExprR :: Env -> ExprR -> SemanticM ExprR
analisaExprR env exprR = case exprR of
    Req e1 e2 -> analisaExprRelacionalBinaria env Req e1 e2
    Rdf e1 e2 -> analisaExprRelacionalBinaria env Rdf e1 e2
    Rlt e1 e2 -> analisaExprRelacionalBinaria env Rlt e1 e2
    Rgt e1 e2 -> analisaExprRelacionalBinaria env Rgt e1 e2
    Rle e1 e2 -> analisaExprRelacionalBinaria env Rle e1 e2
    Rge e1 e2 -> analisaExprRelacionalBinaria env Rge e1 e2




-- Analisa uma expressão lógica
analisaExprL :: Env -> ExprL -> SemanticM ExprL
analisaExprL env exprL = case exprL of
    -- Caso base: uma expressao logica que é, na vv, uma relacional
    Rel exprR -> do 
        novaExprR <- analisaExprR env exprR
        pure (Rel novaExprR)

    -- Casos recursivos para operadores logicos
    And e1 e2 -> do
        novaE1 <- analisaExprL env e1
        novaE2 <- analisaExprL env e2
        pure (And novaE1 novaE2)

    Not e -> do
        novaE <- analisaExprL env e
        pure (Not novaE)