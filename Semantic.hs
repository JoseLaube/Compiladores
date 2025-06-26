module Semantic where

import Ri

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

analisa :: Programa -> SemanticM Programa
analisa (Prog funcoesDefs corposFuncoes varsGlobais blocoPrincipal) = do
    -- Passo 1: Verificar se há funções ou variáveis globais duplicadas.
    -- (Vamos implementar isso em breve)
    
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
    -- Nosso teste de fumaça: quando encontrarmos um comando Imp (print),
    -- emitimos um aviso e continuamos a análise na sua expressão interna.
    Imp expr -> do
        adv "Comando 'print' encontrado."
        -- Por enquanto, a expressão não é analisada, apenas retornada.
        -- Vamos adicionar 'analisaExpr' mais tarde.
        pure (Imp expr)

    -- Para todos os outros comandos, por enquanto, não fazemos nada.
    -- Apenas retornamos o comando como ele é.
    _ -> pure cmd
