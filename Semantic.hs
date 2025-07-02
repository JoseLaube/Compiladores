
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
    go [] _ = pure () 
    go (itemAtual : restoDaLista) nomesVistos = do
        let nomeAtual = extrairNome itemAtual

        if nomeAtual `elem` nomesVistos
           then errorMsg ("Identificador duplicado encontrado: " ++ show nomeAtual)
            else go restoDaLista (nomeAtual : nomesVistos)
        
analisa :: Programa -> Result Programa
analisa (Prog funcoesDefs funcoesCorpos varsGlobais blocoPrincipal) = do
    -- Passo 1: Verificar se há funções ou variáveis globais duplicadas.
    verificaDuplicatas (\(fId :->:_) -> fId) funcoesDefs
    verificaDuplicatas (\(vId :#: _) -> vId) varsGlobais
    
    -- Passo 2: Construir o ambiente inicial.
    
    let envGlobal = (funcoesDefs, varsGlobais)

    -- Passo 3: Analisar o bloco principal do programa.
    blocoPrincipal' <- analisaBloco envGlobal Nothing blocoPrincipal
    
    -- Passo 4: Analisar o corpo de cada função definida
    funcoesCorpos' <- mapM (analisaFuncaoCompleta envGlobal) funcoesCorpos
    
    -- Por enquanto, retornamos uma AST parcialmente processada.
    pure (Prog funcoesDefs funcoesCorpos' varsGlobais blocoPrincipal')



-- Analisa um bloco de comandos
analisaBloco :: Env -> Maybe Funcao -> Bloco -> Result Bloco
analisaBloco _ _ [] = pure [] -- Bloco vazio está sempre correto.
analisaBloco env maybeFuncao (cmd:cmds) = do
    cmd' <- analisaComando env maybeFuncao cmd
    cmds' <- analisaBloco env maybeFuncao cmds
    pure (cmd' : cmds')

analisaFuncaoCompleta :: Env -> (Id, [Var], Bloco) -> Result (Id, [Var], Bloco)
analisaFuncaoCompleta envGlobal (fId, locals, bloco) =
    case buscarFuncao fId envGlobal of
        Nothing -> do
            errorMsg ("errorMsg interno: Corpo definido para função '" ++ fId ++ "' que não possui assinatura.")
            pure (fId, locals, bloco)

        Just (funcao@(_ :->: (params, _))) -> do
            verificaDuplicatas (\(pId :#: _) -> pId) params
            verificaDuplicatas (\(vId :#: _) -> vId) locals
            let nomesParams = map (\(pId :#: _) -> pId) params
            mapM_ (\(lId :#: _) -> when (lId `elem` nomesParams) $
                                     errorMsg ("Variável local '" ++ lId ++ "' tem o mesmo nome de um parâmetro na função '" ++ fId ++ "'.")) locals

            let (funcoesGlobais, varsGlobais) = envGlobal
            let envLocal = (funcoesGlobais, params ++ locals ++ varsGlobais)

            bloco' <- analisaBloco envLocal (Just funcao) bloco

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
        (_, expr') <- analisaExpr env expr
        pure (Imp expr')
    
    -- Comando 'id = expr;'
    Atrib id expr -> do
        (tipoExpr, expr') <- analisaExpr env expr
        case buscarVar id env of
            Nothing -> do
                errorMsg ("Variável de atribuição '" ++ id ++ "' não declarada.")
                pure (Atrib id expr')
 
            Just tipoVar -> do
                if tipoExpr == TVoid then
                    pure (Atrib id expr')
                else case (tipoVar, tipoExpr) of
                    (TDouble, TDouble) -> pure (Atrib id expr')
                    (TInt, TInt)       -> pure (Atrib id expr')
                    (TString, TString) -> pure (Atrib id expr')

                    (TDouble, TInt) -> pure (Atrib id (IntDouble expr'))

                    (TInt, TDouble) -> do
                        warningMsg ("Atribuição de Double para Int na variável '" ++ id ++ "'. Pode haver perda de precisão.")
                        pure (Atrib id (DoubleInt expr'))
                    
                    _ -> do
                        errorMsg ("errorMsg de tipo na atribuição para '" ++ id ++ "'. Esperado " ++ show tipoVar ++ " mas obteve " ++ show tipoExpr ++ ".")
                        pure (Atrib id expr')


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
        cond' <- analisaExprL env cond

        blocoThen' <- analisaBloco env maybeFuncao blocoThen
        blocoElse' <- analisaBloco env maybeFuncao blocoElse

        pure (If cond' blocoThen' blocoElse')

    While cond bloco -> do
        cond' <- analisaExprL env cond
        bloco' <- analisaBloco env maybeFuncao bloco
        pure (While cond' bloco')


    Ret maybeExpr -> case maybeFuncao of
        Nothing -> do
            errorMsg "Comando de retorno ('return') encontrado fora de uma função."
            case maybeExpr of
                Just expr -> Ret . Just . snd <$> analisaExpr env expr
                Nothing   -> pure (Ret Nothing)

        Just (funcao@(_ :->: (_, tipoRetornoEsperado))) ->
            case (maybeExpr, tipoRetornoEsperado) of
                (Nothing, TVoid) -> pure (Ret Nothing)

                (Nothing, tipo) -> do
                    errorMsg ("Função espera um retorno do tipo " ++ show tipo ++ ", mas 'return' foi chamado sem valor.")
                    pure (Ret Nothing)

                (Just expr, TVoid) -> do
                    errorMsg ("Função com retorno 'void' não pode retornar um valor, mas uma expressão foi fornecida.")
                    Ret . Just . snd <$> analisaExpr env expr -- Analisa a expressão por outros erros.

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


analisaArgumentos :: Env -> [Var] -> [Expr] -> Result [Expr]
analisaArgumentos env params args = do
    if length args /= length params then do
        errorMsg ("Numero incorreto de argumentos. Esperado: " ++ show (length params) ++ ", fornecido: " ++ show (length args) ++ ".")
        mapM (fmap snd . analisaExpr env) args
    else do
        let analisaPar p a = analisaComando env Nothing (Atrib (getId p) a) >>= \(Atrib _ a') -> pure a'
              where getId (id :#: _) = id
        
        zipWithM (\p a -> analisaComando ([], [p]) Nothing (Atrib (getId p) a) >>= \(Atrib _ a') -> pure a') params args
          where getId (id :#: _) = id



-- Analisa uma expressão
analisaExpr :: Env ->  Expr -> Result (Tipo, Expr)
analisaExpr env expr = case expr of
    
    Const (CInt n) -> do
        pure (TInt, Const (CInt n))

    Const (CDouble d) -> do
        pure (TDouble, Const (CDouble d))

    Lit s -> do
        pure(TString, Lit s)

    
    IdVar id -> case buscarVar id env of
        Just tipo -> pure (tipo, IdVar id)
        Nothing -> do
            errorMsg("Variavel '" ++ id ++ "' nao declarada.")
            pure(TVoid, IdVar id) -- Retorna TVoid em caso de errorMsg

    Neg e -> do
        (tipoSubExpr, novaSubExpr) <- analisaExpr env e

        if tipoSubExpr == TString
            then do
                errorMsg("Nao se pode negar uma expressao do tipo String.")
                pure (TVoid, Neg novaSubExpr) -- Retorna TVoid em caso de errorMsg
            else
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
    
    Chamada id args -> case buscarFuncao id env of
        Nothing -> do
            errorMsg ("Funcao '" ++ id ++ "' nao declarada.")
            pure (TVoid, Chamada id args)

        Just (_ :->: (params, tipoRetorno)) -> do
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
    Rel exprR -> do 
        novaExprR <- analisaExprR env exprR
        pure (Rel novaExprR)

    And e1 e2 -> do
        novaE1 <- analisaExprL env e1
        novaE2 <- analisaExprL env e2
        pure (And novaE1 novaE2)

    Not e -> do
        novaE <- analisaExprL env e
        pure (Not novaE)
