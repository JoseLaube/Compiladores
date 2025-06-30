module Semantic where

import Ri   
import Control.Monad (when, zipWithM)

--- A Mônada Result, conforme especificado pelo professor.
data Result a = Result (Bool, String, a) deriving Show

instance Functor Result where
  fmap f (Result (b, s, a)) = Result (b, s, f a)

instance Applicative Result where
  pure a = Result (False, "", a)
  Result (b1, s1, f) <*> Result (b2, s2, x) = Result (b1 || b2, s1 <> s2, f x)

instance Monad Result where
  Result (b, s, a) >>= f = let Result (b', s', a') = f a in Result (b || b', s++s', a')

-- Novas funções para emitir mensagens.
errorMsg :: String -> Result ()
errorMsg s = Result (True, "Erro: " ++ s ++ "\n", ())

warningMsg :: String -> Result ()
warningMsg s = Result (False, "Advertencia: " ++ s ++ "\n", ())

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
verificaDuplicatas :: (Eq a, Show a) => (b -> a) -> [b] -> Result ()
verificaDuplicatas extrairNome lista = go lista []
  where
    -- 'go' é uma função auxiliar que faz o trabalho pesado.
    -- O primeiro argumento é a lista que falta verificar.
    -- O segundo argumento é a lista de nomes que já vimos.
    go [] _ = pure () -- Caso base: se a lista a verificar está vazia, terminamos sem errorMsgs.
    
    go (itemAtual : restoDaLista) nomesVistos = do
        let nomeAtual = extrairNome itemAtual

        -- Verifica se o nome extraído já está na lista de nomes vistos
        if nomeAtual `elem` nomesVistos
            -- Se já vimos, emite um errorMsg e para.
            then errorMsg ("Identificador duplicado encontrado: " ++ show nomeAtual)
            -- Se não, continua a verificação recursivamente.
            else go restoDaLista (nomeAtual : nomesVistos)
                -- Continua com o resto da lista...
                -- ...e adiciona o nome atual à lista de nomes vistos para as próximas verificações.

analisa :: Programa -> Result Programa
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
analisaBloco :: Env -> Maybe Funcao -> Bloco -> Result Bloco
analisaBloco _ _ [] = pure [] -- Bloco vazio está sempre correto.
analisaBloco env maybeFuncao (cmd:cmds) = do
    -- Analisa o primeiro comando
    cmd' <- analisaComando env maybeFuncao cmd
    -- Analisa o resto do bloco
    cmds' <- analisaBloco env maybeFuncao cmds
    -- Retorna o novo bloco com os comandos analisados
    pure (cmd' : cmds')

analisaFuncaoCompleta :: Env -> (Id, [Var], Bloco) -> Result (Id, [Var], Bloco)
analisaFuncaoCompleta envGlobal (fId, locals, bloco) =
    -- Primeiro, encontramos a assinatura completa da função para obter seus parâmetros e tipo de retorno.
    case buscarFuncao fId envGlobal of
        Nothing -> do
            errorMsg ("errorMsg interno: Corpo definido para função '" ++ fId ++ "' que não possui assinatura.")
            pure (fId, locals, bloco)

        Just (funcao@(_ :->: (params, _))) -> do
            -- 1. Verificar duplicatas entre parâmetros e variáveis locais.
            verificaDuplicatas (\(pId :#: _) -> pId) params
            verificaDuplicatas (\(vId :#: _) -> vId) locals
            let nomesParams = map (\(pId :#: _) -> pId) params
            mapM_ (\(lId :#: _) -> when (lId `elem` nomesParams) $
                                     errorMsg ("Variável local '" ++ lId ++ "' tem o mesmo nome de um parâmetro na função '" ++ fId ++ "'.")) locals

            -- 2. Construir o ambiente LOCAL da função.
            let (funcoesGlobais, varsGlobais) = envGlobal
            let envLocal = (funcoesGlobais, params ++ locals ++ varsGlobais)

            -- 3. Analisar o bloco da função com o ambiente local.
            bloco' <- analisaBloco envLocal (Just funcao) bloco

            -- 4. Retorna a nova tupla representando o corpo da função analisada.
            pure (fId, locals, bloco')



-- Substitua sua função 'coercao' por esta:
coercao :: String -> Expr -> Expr -> Tipo -> Tipo -> Result (Tipo, Expr, Expr)
coercao opStr e1 e2 t1 t2
  | t1 == t2 && (t1 == TInt || t1 == TDouble) = return (t1, e1, e2)
  | t1 == TInt && t2 == TDouble = return (TDouble, IntDouble e1, e2)
  | t1 == TDouble && t2 == TInt = return (TDouble, e1, IntDouble e2)
  | otherwise = do
      errorMsg $ "Erro de tipos na expressao. Operador '" ++ opStr ++ "' nao pode ser aplicado a " ++
                 "operandos dos tipos " ++ show t1 ++ " e " ++ show t2 ++ "."
      return (TVoid, e1, e2) -- Retorna tipo de erro

-- Analisa um único comando
analisaComando :: Env -> Maybe Funcao -> Comando -> Result Comando
analisaComando env maybeFuncao cmd = case cmd of
    
    -- comando print(expr)
    Imp expr -> do
        -- warningMsg "Comando 'print' encontrado."
        (_, expr') <- analisaExpr env expr
        -- Retorna o comando Imp com a expressão analisada.
        pure (Imp expr')
    
    -- Comando 'id = expr;'
    Atrib id expr -> do
        (tipoExpr, expr') <- analisaExpr env expr
        case buscarVar id env of
            Nothing -> do
                errorMsg ("Variável de atribuição '" ++ id ++ "' não declarada.")
                pure (Atrib id expr')
 
            Just tipoVar -> do
                -- Se a expressão já resultou em errorMsg, não fazemos mais nada.
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
                        warningMsg ("Atribuição de Double para Int na variável '" ++ id ++ "'. Pode haver perda de precisão.")
                        pure (Atrib id (DoubleInt expr'))
                    
                    -- Caso 4: Todos os outros são errorMsgs de tipo.
                    _ -> do
                        errorMsg ("errorMsg de tipo na atribuição para '" ++ id ++ "'. Esperado " ++ show tipoVar ++ " mas obteve " ++ show tipoExpr ++ ".")
                        pure (Atrib id expr')


    -- Chamada de um procedimento (função que não retorna valor)
    Proc id args -> case buscarFuncao id env of
        Nothing -> do
            errorMsg ("Procedimento '" ++ id ++ "' não declarado.")
            pure (Proc id args)

        Just (_ :->: (params, tipoRetorno)) -> do
            when (tipoRetorno /= TVoid) $
                warningMsg ("Função '" ++ id ++ "' que retorna " ++ show tipoRetorno ++ " está sendo chamada como um procedimento. O valor de retorno será descartado.")
            
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
            errorMsg "Comando de retorno ('return') encontrado fora de uma função."
            -- Analisa a expressão mesmo assim, se houver, para encontrar outros erros.
            case maybeExpr of
                Just expr -> Ret . Just . snd <$> analisaExpr env expr
                Nothing   -> pure (Ret Nothing)

        Just (funcao@(_ :->: (_, tipoRetornoEsperado))) ->
            case (maybeExpr, tipoRetornoEsperado) of
                -- Caso correto: return; em uma função void.
                (Nothing, TVoid) -> pure (Ret Nothing)

                -- Erro: return; em uma função que espera um valor.
                (Nothing, tipo) -> do
                    errorMsg ("Função espera um retorno do tipo " ++ show tipo ++ ", mas 'return' foi chamado sem valor.")
                    pure (Ret Nothing)

                -- Erro: return <expr>; em uma função void.
                (Just expr, TVoid) -> do
                    errorMsg ("Função com retorno 'void' não pode retornar um valor, mas uma expressão foi fornecida.")
                    Ret . Just . snd <$> analisaExpr env expr -- Analisa a expressão por outros erros.

                -- Caso correto: return <expr>; em uma função que espera um valor.
                (Just expr, tipo) -> do
                    (tipoExpr, expr') <- analisaExpr env expr
                    if tipoExpr == TVoid then
                        pure (Ret (Just expr')) -- Erro já emitido na análise da expressão.
                    else case (tipo, tipoExpr) of
                        _ | tipo == tipoExpr -> pure (Ret (Just expr'))
                        (TDouble, TInt)      -> pure (Ret (Just (IntDouble expr')))
                        (TInt, TDouble)      -> do
                            warningMsg ("Retorno de Double em uma função que espera Int. Pode haver perda de precisão.")
                            pure (Ret (Just (DoubleInt expr')))
                        _ -> do
                            errorMsg ("Tipo de retorno incorreto. Esperado " ++ show tipo ++ " mas a função retorna " ++ show tipoExpr ++ ".")
                            pure (Ret (Just expr'))


    _ -> pure cmd


-- | Analisa e aplica coerção aos argumentos de uma chamada de função.
analisaArgumentos :: Env -> [Var] -> [Expr] -> Result [Expr]
analisaArgumentos env params args = do
    -- Primeiro, verifica a aridade
    if length args /= length params then do
        errorMsg ("Numero incorreto de argumentos. Esperado: " ++ show (length params) ++ ", fornecido: " ++ show (length args) ++ ".")
        -- Analisa os argumentos mesmo assim para encontrar outros errorMsgs
        mapM (fmap snd . analisaExpr env) args
    else do
        -- 'zipWithM' itera sobre argumentos e parâmetros, aplicando a análise a cada par.
        let analisaPar p a = analisaComando env Nothing (Atrib (getId p) a) >>= \(Atrib _ a') -> pure a'
              where getId (id :#: _) = id
        
        -- Truque inteligente: Reutilizamos a lógica de 'Atrib' para fazer a coerção!
        -- Criamos um ambiente temporário apenas com o parâmetro e "atribuímos" o argumento a ele.
        zipWithM (\p a -> analisaComando ([], [p]) Nothing (Atrib (getId p) a) >>= \(Atrib _ a') -> pure a') params args
          where getId (id :#: _) = id



-- Analisa uma expressão
analisaExpr :: Env ->  Expr -> Result (Tipo, Expr)
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
            errorMsg("Variavel '" ++ id ++ "' nao declarada.")
            pure(TVoid, IdVar id) -- Retorna TVoid em caso de errorMsg

    -- CASOS RECURSIVOS
    Neg e -> do
        -- 1. Analise recursiva da expressão 'e'
        (tipoSubExpr, novaSubExpr) <- analisaExpr env e

        -- 2. Verifica se o tipo é compatível com a negação (so nao é valida se for string)
        if tipoSubExpr == TString
            then do
                errorMsg("Nao se pode negar uma expressao do tipo String.")
                pure (TVoid, Neg novaSubExpr) -- Retorna TVoid em caso de errorMsg
            else
                -- 3. Retorna o tipo e a nova expressão (Negar um Double retorna um double)
                pure (tipoSubExpr, Neg novaSubExpr)


    Add e1 e2 -> do
        (t1, e1') <- analisaExpr env e1
        (t2, e2') <- analisaExpr env e2
        (tipoFinal, e1'', e2'') <- coercao "+" e1' e2' t1 t2
        return (tipoFinal, Add e1'' e2'')

    Sub e1 e2 -> do
        (t1, e1') <- analisaExpr env e1
        (t2, e2') <- analisaExpr env e2
        (tipoFinal, e1'', e2'') <- coercao "-" e1' e2' t1 t2
        return (tipoFinal, Sub e1'' e2'')

    Mul e1 e2 -> do
        (t1, e1') <- analisaExpr env e1
        (t2, e2') <- analisaExpr env e2
        (tipoFinal, e1'', e2'') <- coercao "*" e1' e2' t1 t2
        return (tipoFinal, Mul e1'' e2'')

    Div e1 e2 -> do
        (t1, e1') <- analisaExpr env e1
        (t2, e2') <- analisaExpr env e2
        (tipoFinal, e1'', e2'') <- coercao "/" e1' e2' t1 t2
        return (tipoFinal, Div e1'' e2'')
    
    -- Chamada de função como 'f(a,b)'
    Chamada id args -> case buscarFuncao id env of
        Nothing -> do
            errorMsg ("Funcao '" ++ id ++ "' nao declarada.")
            pure (TVoid, Chamada id args)

        Just (_ :->: (params, tipoRetorno)) -> do
            -- A nova função cuida de tudo: aridade, tipos e coerção.
            novosArgs <- analisaArgumentos env params args
            pure (tipoRetorno, Chamada id novosArgs)

    
    _ -> pure(TVoid, expr) -- placeholder generico



analisaExprRelacionalBinaria :: Env -> (Expr -> Expr -> ExprR) -> String -> Expr -> Expr -> Result ExprR
analisaExprRelacionalBinaria env construtor opStr e1 e2 = do
    (t1, e1') <- analisaExpr env e1
    (t2, e2') <- analisaExpr env e2
    if t1 == TString && t2 == TString then
        pure (construtor e1' e2')
    else do
        (_, coercedE1, coercedE2) <- coercao opStr e1' e2' t1 t2
        pure (construtor coercedE1 coercedE2)

analisaExprR :: Env -> ExprR -> Result ExprR
analisaExprR env exprR = case exprR of
    Req e1 e2 -> analisaExprRelacionalBinaria env Req "==" e1 e2
    Rdf e1 e2 -> analisaExprRelacionalBinaria env Rdf "/=" e1 e2
    Rlt e1 e2 -> analisaExprRelacionalBinaria env Rlt "<"  e1 e2
    Rgt e1 e2 -> analisaExprRelacionalBinaria env Rgt ">"  e1 e2
    Rle e1 e2 -> analisaExprRelacionalBinaria env Rle "<=" e1 e2
    Rge e1 e2 -> analisaExprRelacionalBinaria env Rge ">=" e1 e2




-- Analisa uma expressão lógica
analisaExprL :: Env -> ExprL -> Result ExprL
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