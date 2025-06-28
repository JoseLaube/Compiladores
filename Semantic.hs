module Semantic where

import Ri
import Distribution.Compat.Lens (_1)

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
analisa (Prog funcoesDefs corposFuncoes varsGlobais blocoPrincipal) = do
    -- Passo 1: Verificar se há funções ou variáveis globais duplicadas.
    verificaDuplicatas (\(fId :->:_) -> fId) funcoesDefs
    verificaDuplicatas (\(vId :#: _) -> vId) varsGlobais
    
    -- Passo 2: Construir o ambiente inicial.
    -- Todas as funções são visíveis em todos os lugares.
    let funcoesAssinaturas = funcoesDefs
    let envGlobal = (funcoesAssinaturas, varsGlobais)

    -- Passo 3: Analisar o bloco principal do programa.
    -- O 'Nothing' indica que não estamos dentro de uma função (importante para o 'return').
    blocoPrincipal' <- analisaBloco envGlobal Nothing blocoPrincipal
    
    -- Passo 4: Analisar o corpo de cada função definida.
    -- (Vamos implementar isso em breve)

    -- Por enquanto, retornamos uma AST parcialmente processada.
    pure (Prog funcoesDefs corposFuncoes varsGlobais blocoPrincipal')



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
        -- 1. Verificamos se a variável do lado esquerdo da atribuição existe
        case buscarVar id env of
            Just _  -> pure () -- Se existe, ótimo, não fazemos nada.
            Nothing -> erro ("Variável de atribuição '" ++ id ++ "' não declarada.")
        
        -- 2. AQUI É A OUTRA CONEXÃO: Analisamos a expressão do lado direito
        (_, expr') <- analisaExpr env expr

        -- Por enquanto, não comparamos os tipos (isso é Fase 3/4).
        -- Apenas retornamos o comando com a expressão analisada.
        pure (Atrib id expr')


    Proc id args -> case buscarFuncao id env of
        Nothing -> do
            erro ("Procedimento '" ++ id ++ "' não declarado.")
            pure (Proc id args) -- Retorna o comando original
        Just _ -> do
            -- Função existe. Agora analisamos os argumentos.
            argsAnalisados <- mapM (analisaExpr env) args
            let novosArgs = map snd argsAnalisados
            -- Retorna o comando Proc com os argumentos analisados
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


    -- Para todos os outros comandos, por enquanto, não fazemos nada.
    _ -> pure cmd



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


    Add e1 e2 -> do
        -- 1. Analisa recursivamente o lado esquerdo e1
        (tipo1, novaE1)  <- analisaExpr env e1
        -- 2. Analisa recursivamente o lado direito e2
        (tipo2, novaE2)  <- analisaExpr env e2

        --
        if tipo1 == tipo2 && (tipo1 == TInt || tipo1 == TDouble)
            then
                -- 3. Se ambos os tipos são compatíveis, retorna o tipo e a nova expressão
                pure (tipo1, Add novaE1 novaE2)
            else do
                -- 4. Se os tipos não são compatíveis, emite um erro
                erro ("Tipos incompatíveis para adição: " ++ show tipo1 ++ " e " ++ show tipo2)
                pure (TVoid, Add novaE1 novaE2) -- Retorna TVoid em caso de erro

    -- Subtração, Multiplcação e Divisão seguem a mesma lógica de Adição
    Sub e1 e2 -> do
        (tipo1, novaE1) <- analisaExpr env e1
        (tipo2, novaE2) <- analisaExpr env e2

        if tipo1 == tipo2 && (tipo1 == TInt || tipo1 == TDouble)
            then
                -- 3. Se ambos os tipos são compatíveis, retorna o tipo e a nova expressão
                pure (tipo1, Sub novaE1 novaE2)
            else do
                -- 4. Se os tipos não são compatíveis, emite um erro
                erro ("Tipos incompatíveis para Subtração: " ++ show tipo1 ++ " e " ++ show tipo2)
                pure (TVoid, Sub novaE1 novaE2) -- Retorna TVoid em caso de erro

    Mul e1 e2 -> do
        (tipo1, novaE1) <- analisaExpr env e1
        (tipo2, novaE2) <- analisaExpr env e2

        if tipo1 == tipo2 && (tipo1 == TInt || tipo1 == TDouble)
            then
                -- 3. Se ambos os tipos são compatíveis, retorna o tipo e a nova expressão
                pure (tipo1, Mul novaE1 novaE2)
            else do
                -- 4. Se os tipos não são compatíveis, emite um erro
                erro ("Tipos incompatíveis para Multiplicação: " ++ show tipo1 ++ " e " ++ show tipo2)
                pure (TVoid, Mul novaE1 novaE2) -- Retorna TVoid em caso de erro

    Div e1 e2 -> do
        (tipo1, novaE1) <- analisaExpr env e1
        (tipo2, novaE2) <- analisaExpr env e2

        if tipo1 == tipo2 && (tipo1 == TInt || tipo1 == TDouble)
            then
                -- 3. Se ambos os tipos são compatíveis, retorna o tipo e a nova expressão
                pure (tipo1, Div novaE1 novaE2)
            else do
                -- 4. Se os tipos não são compatíveis, emite um erro
                erro ("Tipos incompatíveis para Divisão: " ++ show tipo1 ++ " e " ++ show tipo2)
                pure (TVoid, Div novaE1 novaE2) -- Retorna TVoid em caso de erro
    
    -- Chamada de função como 'f(a,b)'
    Chamada id args -> case buscarFuncao id env of
        -- CASO 1: A função NÃO foi encontrada
        Nothing -> do
            -- O que você deve fazer aqui?
            -- 1. Emitir uma mensagem de erro apropriada.
            -- 2. Retornar um tipo de erro (TVoid) e a expressão original.
            erro ("Função '" ++ id ++ "' não declarada.")
            pure (TVoid, Chamada id args)

        -- CASO 2: A função FOI encontrada
        Just funcao -> do
            -- 1. Extraia o tipo de retorno da assinatura da função.
            -- Dica: Use pattern matching na 'funcao'.
            let (_ :->: (_, tipoRetorno)) = funcao
            
            -- 2. Analise a lista de argumentos 'args'.
            -- Use 'mapM' para aplicar 'analisaExpr env' a cada argumento em 'args'.
            -- 'mapM (analisaExpr env) args' retornará um SemanticM [(Tipo, Expr)]
            argsAnalisados <- mapM (analisaExpr env) args
            
            -- 3. 'mapM' nos deu uma lista de tuplas (Tipo, Expr).
            -- Para a nova AST da Chamada, só precisamos da lista de expressões.
            -- Use 'map snd' para extrair apenas as expressões da lista de tuplas.
            let novosArgs = map snd argsAnalisados
            
            -- 4. Retorne o tipo de retorno da função e a nova AST da Chamada.
            pure (tipoRetorno, Chamada id novosArgs)

    


    _ -> pure(TVoid, expr) -- placeholder generico



-- analisaExprRelacionalBinaria: Esta função encapsula a lógica comum para todas as expressões relacionais binárias.
-- Ela recebe:
--   - O ambiente 'env'.
--   - O construtor da expressão relacional (uma função como Req, Rdf, etc.).
--   - As duas sub-expressões e1 e e2.
analisaExprRelacionalBinaria :: Env -> (Expr -> Expr -> ExprR) -> Expr -> Expr -> SemanticM ExprR
analisaExprRelacionalBinaria env construtor e1 e2 = do
    -- 1. Analisa as duas sub-expressões
    (tipo1, novaE1) <- analisaExpr env e1
    (tipo2, novaE2) <- analisaExpr env e2

    -- 2. Aplica a lógica de verificação de tipos (a mesma que você já escreveu)
    if (tipo1 == TString && tipo2 /= TString) || (tipo1 /= TString && tipo2 == TString) then do
        erro ("Comparação de String com não-String: " ++ show e1 ++ " e " ++ show e2)
        -- Mesmo com erro, construímos a nova expressão com o construtor original
        pure (construtor novaE1 novaE2)
    else if tipo1 /= tipo2 && tipo1 /= TString && tipo2 /= TString then do
        erro ("Comparação entre tipos numéricos diferentes (sem coerção ainda): " ++ show tipo1 ++ " e " ++ show tipo2)
        pure (construtor novaE1 novaE2)
    else
        -- Tudo certo, construímos a expressão final
        pure (construtor novaE1 novaE2)


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