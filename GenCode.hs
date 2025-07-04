-- GenCode.hs
module GenCode (gerar) where

import Ri
import Control.Monad.State
import qualified Data.Map as Map
import Data.Map (Map)

-- ... (SymTab, criarTabela, buscarIndice - Nenhuma mudança necessária aqui) ...
type SymTab = Map Id Int
criarTabela :: [Id] -> Int -> (SymTab, Int)
criarTabela nomes indiceInicial = (Map.fromList indices, proxIndice)
  where
    indices = zip nomes [indiceInicial..]
    proxIndice = indiceInicial + length nomes
buscarIndice :: Id -> SymTab -> Maybe Int
buscarIndice nome tabela = Map.lookup nome tabela
-- ...

novoLabel :: State Int String
novoLabel = do { n <- get; put (n + 1); return ("l" ++ show n) }

-- Gera código para expressões que produzem um valor na pilha (R-Values)
genExprR :: SymTab -> Expr -> State Int String
genExprR symTab (Const (CInt i)) = return ("\tbipush " ++ show i ++ "\n")
genExprR symTab (IdVar nome) =
    case buscarIndice nome symTab of
        Just indice -> return ("\tiload " ++ show indice ++ "\n")
        Nothing -> error ("[CodeGen] Variavel nao encontrada: " ++ nome)
genExprR symTab (Add e1 e2) = do
    code1 <- genExprR symTab e1
    code2 <- genExprR symTab e2
    return (code1 ++ code2 ++ "\tiadd\n")
-- --- TODO: Próximos Passos para genExprR ---
-- 1. Adicionar os outros operadores aritméticos.
-- genExprR symTab (Sub e1 e2) = ... (usar isub)
-- genExprR symTab (Mul e1 e2) = ... (usar imul)
-- genExprR symTab (Div e1 e2) = ... (usar idiv)
-- genExprR symTab (Neg e)     = ... (gerar 'e' e depois 'ineg')

-- 2. Lidar com outros tipos de constantes e literais.
-- genExprR symTab (Const (CDouble d)) = return ("\tldc2_w " ++ show d ++ "\n") -- para doubles
-- genExprR symTab (Lit s)             = return ("\tldc \"" ++ s ++ "\"\n")   -- para strings

-- 3. Lidar com coerção de tipos que a análise semântica inseriu.
-- genExprR symTab (IntDouble e) = do { code <- genExprR symTab e; return (code ++ "\ti2d\n") }
-- genExprR symTab (DoubleInt e) = do { code <- genExprR symTab e; return (code ++ "\td2i\n") }

-- 4. Lidar com chamadas de função que retornam valor.
-- genExprR symTab (Chamada id args) = ... (gerar código para os args, depois invokestatic)

-- --- FIM dos TODOs para genExprR ---


-- --- TODO: Nova Seção Inteira - Expressões Lógicas e Relacionais ---
-- Precisamos de funções para gerar código para If/While.
-- A ideia é gerar saltos (jumps) em vez de valores true/false.

-- genExprR_relacional: Gera código para uma comparação.
-- Recebe dois labels: para onde saltar se for VERDADEIRO e para onde saltar se for FALSO.
-- genExprR_relacional :: SymTab -> String -> String -> ExprR -> State Int String
-- genExprR_relacional symTab lTrue lFalse (Req e1 e2) = do
--     code1 <- genExprR symTab e1
--     code2 <- genExprR symTab e2
--     -- Compara os dois valores no topo da pilha e salta para lTrue se forem iguais.
--     -- Caso contrário, a execução continua e salta para lFalse.
--     return (code1 ++ code2 ++ "\tif_icmpeq " ++ lTrue ++ "\n" ++ "\tgoto " ++ lFalse ++ "\n")
-- -- ... implementar para Rdf (if_icmpne), Rlt (if_icmplt), etc.

-- genExprL: Gera código para uma expressão lógica completa (com And, Or, Not).
-- genExprL :: SymTab -> String -> String -> ExprL -> State Int String
-- genExprL symTab lTrue lFalse (Rel exprR) = genExprR_relacional symTab lTrue lFalse exprR
-- genExprL symTab lTrue lFalse (And e1 e2) = do
--     lMeio <- novoLabel
--     -- Lógica do 'And': se e1 for falso, salta direto para lFalse. Se for verdadeiro, continua para lMeio.
--     code1 <- genExprL symTab lMeio lFalse e1
--     -- Em lMeio, avaliamos e2.
--     code2 <- genExprL symTab lTrue lFalse e2
--     return (code1 ++ lMeio ++ ":\n" ++ code2)
-- -- ... implementar para Or e Not.

-- --- FIM da Seção de Expressões Lógicas ---


-- Gera código para comandos
genCmd :: SymTab -> Comando -> State Int String
genCmd symTab (Atrib nome expr) = do
    exprCode <- genExprR symTab expr
    case buscarIndice nome symTab of
        Just indice -> return (exprCode ++ "\tistore " ++ show indice ++ "\n")
        Nothing -> error ("[CodeGen] Variavel nao encontrada: " ++ nome)
genCmd symTab (Imp expr) = do
    exprCode <- genExprR symTab expr
    return (
        "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n" ++
        exprCode ++
        -- --- TODO: Melhorar 'Imp' para lidar com diferentes tipos ---
        -- A instrução println é sobrecarregada. Precisamos saber o tipo da 'expr'
        -- para escolher a assinatura correta. Ex: (I)V para Int, (D)V para Double, etc.
        "\tinvokevirtual java/io/PrintStream/println(I)V\n"
        )
-- --- TODO: Próximos Passos para genCmd ---
-- 1. Implementar If/While usando a nova função genExprL.
-- genCmd symTab (If cond blocoThen blocoElse) = do
--     lTrue <- novoLabel
--     lFalse <- novoLabel
--     lEnd <- novoLabel
--     condCode <- genExprL symTab lTrue lFalse cond
--     thenCode <- genBloco symTab blocoThen
--     elseCode <- genBloco symTab blocoElse
--     return (condCode ++ lTrue ++ ":\n" ++ thenCode ++ "\tgoto " ++ lEnd ++ "\n" ++ lFalse ++ ":\n" ++ elseCode ++ lEnd ++ ":\n")
-- genCmd symTab (While cond bloco) = ... (lógica similar com 3 labels)

-- 2. Implementar chamada de procedimento (função que não retorna valor).
-- genCmd symTab (Proc id args) = ... (mesma lógica da Chamada, mas sem esperar valor de retorno)

-- 3. Implementar Leitura e Retorno.
-- genCmd symTab (Leitura id) = ... (usar java.util.Scanner para ler e 'istore'/'dstore' para salvar)
-- genCmd symTab (Ret maybeExpr) = ... (gerar código para maybeExpr e usar 'ireturn'/'dreturn' ou 'return' para void)

-- --- FIM dos TODOs para genCmd ---

-- Gera código para um bloco de comandos
genBloco :: SymTab -> Bloco -> State Int String
genBloco symTab comandos = do
    codes <- mapM (genCmd symTab) comandos
    return (concat codes)

-- ... (genMainCab, genCabecalhoClasse - Nenhuma mudança necessária) ...
genMainCab :: Int -> Int -> String
genMainCab s l = ".method public static main([Ljava/lang/String;)V\n\t.limit stack "++show s++"\n\t.limit locals "++show l++"\n\n"
genCabecalhoClasse n = ".class public "++n++"\n.super java/lang/Object\n\n.method public <init>()V\n\taload_0\n\tinvokenonvirtual java/lang/Object/<init>()V\n\treturn\n.end method\n\n"

-- Gera o código para o método main
genMain :: [Var] -> Bloco -> State Int String
genMain varsGlobais blocoPrincipal = do
    let nomesVars = map (\(varNome :#: _) -> varNome) varsGlobais
    let (symTab, proxIndice) = criarTabela nomesVars 1
    let numLocals = proxIndice
    let stackSize = 20
    let cabecalho = genMainCab stackSize numLocals
    corpo <- genBloco symTab blocoPrincipal
    return (cabecalho ++ corpo ++ "\treturn\n.end method\n")

-- Orquestra a geração de código para o programa inteiro
genProg :: String -> Programa -> State Int String
genProg nomePrograma (Prog funcoesDefs funcoesCorpos varsGlobais blocoPrincipal) = do
    let cabecalhoClasse = genCabecalhoClasse nomePrograma
    mainCode <- genMain varsGlobais blocoPrincipal

    -- --- TODO: Próximo Passo para genProg ---
    -- 1. Gerar código para as funções definidas pelo usuário.
    --    Você precisará de uma nova função 'genFuncao' e chamá-la para cada item em 'funcoesCorpos'.
    -- funcoesCode <- mapM (genFuncao symTabGlobal) funcoesCorpos
    -- return (cabecalhoClasse ++ mainCode ++ concat funcoesCode)
    
    return (cabecalhoClasse ++ mainCode)

-- Função principal que será chamada por Main.hs
gerar :: String -> Programa -> String
gerar nomePrograma ast = fst $ runState (genProg nomePrograma ast) 0