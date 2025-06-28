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
-- Uma operação pode depender do resultado da anterior, e as mensagens
-- são sempre acumuladas.
instance Monad SemanticM where
    (Sem (s1, a)) >>= f = let Sem (s2, b) = f a in Sem (s1 ++ s2, b)

-- Função auxiliar para registrar um erro.
erro :: String -> SemanticM ()
erro msg = Sem ("Erro: " ++ msg ++ "\n", ())

-- Função auxiliar para registrar um aviso.
adv :: String -> SemanticM ()
adv msg = Sem ("Aviso: " ++ msg ++ "\n", ())

-- O Ambiente de Análise: uma lista de todas as funções e uma lista
-- das variáveis no escopo atual.
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

    