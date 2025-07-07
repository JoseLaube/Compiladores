-- GenCode.hs
module GenCode (gerar) where

import Ri
import Control.Monad.State
import qualified Data.Map as Map
import Data.Map (Map)

type SymTab = Map Id (Tipo, Int)   -- A symtab agora mapeia um id para uma tupla (Tipo, Indice)

-- funcao para criar a tabela apartir da lista de varaiveis da AST, retorna a tabela e o prox indice livre
criarTabela :: [Var] -> Int -> (SymTab, Int)
criarTabela vars indiceInicial = (Map.fromList entradas, proxIndice)
    where
        entradas = zip (map getId vars) (zip (map getTipo vars) [indiceInicial..])
        proxIndice = indiceInicial + length vars
        -- funcs auxiliares para extrair o Id e Tipo de uma Var
        getId (id :#: _) = id
        getTipo (_ :#: (tipo, _)) = tipo

-- func para buscar um simbolo na tabela
buscarSimbolo :: Id -> SymTab -> Maybe (Tipo, Int)
buscarSimbolo nome tabela = Map.lookup nome tabela

novoLabel :: State Int String
novoLabel = do { n <- get; put (n + 1); return ("l" ++ show n) }

-- gera codigo para expressoes que sobem valores para a pilha
genExpr :: SymTab -> Expr -> State Int (Tipo, String)
genExpr symTab (Const (CInt i))    = return (TInt, genInt i)
genExpr symTab (Const (CDouble d)) = return (TDouble, "\tldc2_w " ++ show d ++ "\n")
genExpr symTab (Lit s)             = return (TString, "\tldc \"" ++ s ++ "\"\n")

genExpr symTab (IdVar nome) = 
    case buscarSimbolo nome symTab of
        Nothing ->
            -- erro que nao deve acontecer mas deixar a verificacao dele aqui
            error("[CodeGen] Erro fatal: variavel '" ++ nome ++ "' nao encontrada na tabela de simbolos")

        Just (tipo, indice) ->
            let instr = case tipo of
                            TInt -> "iload"
                            TDouble -> "dload"
                            TString -> "aload"
                            _   -> error "[CodeGen] Tipo de variavel não suportada"   -- outro erro possivel
        
            in return (tipo, "\t" ++ instr ++ " " ++ show indice ++ "\n") -- o retorno é o tipo da variavel e o codigo para load na pilha

genExpr tab (Add e1 e2) = do
    (t1, e1') <- genExpr tab e1
    (t2, e2') <- genExpr tab e2
    return (t1, e1' ++ e2' ++ genOp t1 "add")

genExpr tab (Sub e1 e2) = do
    (t1, e1') <- genExpr tab e1
    (t2, e2') <- genExpr tab e2
    return (t1, e1' ++ e2' ++ genOp t1 "sub")

genExpr tab (Mul e1 e2) = do
    (t1, e1') <- genExpr tab e1
    (t2, e2') <- genExpr tab e2
    return (t1, e1' ++ e2' ++ genOp t1 "mul")

genExpr tab (Div e1 e2) = do
    (t1, e1') <- genExpr tab e1
    (t2, e2') <- genExpr tab e2
    return (t1, e1' ++ e2' ++ genOp t1 "div")

genExpr tab (Neg e) = do
    (tipo, code) <- genExpr tab e
    return (tipo, code ++ genOp tipo "neg")

genExpr tab (IntDouble e) = do
    (_, code) <- genExpr tab e
    return (TDouble, code ++ "\ti2d\n")

genExpr tab (DoubleInt e) = do
    (_, code) <- genExpr tab e
    return (TInt, code ++ "\td2i\n")


genExpr _ _ = return (TVoid, ";; TODO: implementar outros casos de genExpr\n")


-- func que recebe a SymTab, a expressao, o label v e f
genExprL :: SymTab -> ExprL -> String -> String -> State Int String
-- a expressao logica é uma unica expressao relacional
genExprL tab (Rel exprR) lTrue lFalse = genExprR tab exprR lTrue lFalse

genExprL tab (And e1 e2) lTrue lFalse = do
    lMeio <- novoLabel

    code1 <- genExprL tab e1 lMeio lFalse  -- gera o codigo de e1 e ve se pula pro final ou segue a avaliacao
    code2 <- genExprL tab e2 lTrue lFalse -- o mesmo, mas aqui pode concluir que a exprL é V

    return (code1 ++ lMeio ++":\n" ++ code2)

genExprL tab (Or e1 e2) lTrue lFalse = do
    lMeio <- novoLabel

    code1 <- genExprL tab e1 lTrue lMeio -- se e1 é V entao pode pular para o final, se nao devemos segir para lMeio
    code2 <- genExprL tab e2 lTrue lFalse

    return (code1 ++ lMeio ++ ":\n" ++ code2)

genExprL tab (Not e) lTrue lFalse = 
    genExprL tab e lFalse lTrue  -- basta inverter os saltos



-- Gera código para uma expressão RELACIONAL que resulta em um salto.
genExprR :: SymTab -> ExprR -> String -> String -> State Int String
genExprR tab exprR lTrue lFalse = do
    -- A lógica de gerar o código das sub-expressões é a mesma para todos.
    let (op, e1, e2) = case exprR of
                        Req a b -> ("==", a, b)
                        Rdf a b -> ("/=", a, b)
                        Rle a b -> ("<=", a, b)
                        Rge a b -> (">=", a, b)
                        Rlt a b -> ("<",  a, b)
                        Rgt a b -> (">",  a, b)
    
    (tipo1, code1) <- genExpr tab e1
    (_,     code2) <- genExpr tab e2

    let relCode = genRel op tipo1 lTrue
    return (code1 ++ code2 ++ relCode ++ "\tgoto " ++ lFalse ++ "\n")


-- Gera código para comandos
genCmd :: SymTab -> Comando -> State Int String
genCmd symTab (Atrib nome expr) = do
    (_, codeExpr) <- genExpr symTab expr -- gera o codigo para a expressao do lado direito, isso deixa a expressao no topo da pilha

    case buscarSimbolo nome symTab of
        Nothing -> error ("[CodeGen] Erro fatal: variavel de atribuicao '"++ nome ++ "' nao encontrada")
        Just (tipo, indice) -> do
            let instr = case tipo of
                            TInt   -> "istore"
                            TDouble -> "dstore"
                            TString -> "astore"
                            _       -> error "[CodeGen] Atribuicao para tipo invalido!"
            return (codeExpr ++ "\t" ++ instr ++ " " ++ show indice ++ "\n")

genCmd symTab (Imp expr) = do
    (tipoExpr, codeExpr) <- genExpr symTab expr
    let tipoJasmin = case tipoExpr of
                        TInt    -> "I"
                        TDouble -> "D"
                        TString -> "Ljava/lang/String;"
                        _       -> "V" -- so para casos de erros indefinidos
    return ( "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n" ++ codeExpr ++ "\tinvokevirtual java/io/PrintStream/println(" ++ tipoJasmin ++ ")V\n")

genCmd tab (If cond blocoThen []) = do   -- if sem else
    lTrue <- novoLabel
    lEnd <- novoLabel 

    codeCond <-genExprL tab cond lTrue lEnd
    codeThen <- genBloco tab blocoThen
    return (codeCond ++ lTrue ++ ":\n" ++ codeThen ++ lEnd ++ ":\n")

genCmd tab (If cond blocoThen blocoElse) = do   -- if com else
    lTrue <- novoLabel
    lFalse <- novoLabel
    lEnd <- novoLabel 

    codeCond <- genExprL tab cond lTrue lFalse  -- gera o codigo e faz o salto se for true ou false

    codeThen <-genBloco tab blocoThen
    codeElse <- genBloco tab blocoElse

    return (codeCond ++ lTrue ++ ":\n" ++ codeThen ++ "\tgoto " ++ lEnd ++ "\n" ++ lFalse ++ ":\n" ++ codeElse ++ "\tgoto " ++ lEnd ++ "\n" ++ lEnd ++ ":\n")

genCmd tab (While cond blocoLoop) = do
    lTeste <- novoLabel
    lCorpo <- novoLabel
    lEnd <- novoLabel

    codeCond <- genExprL tab cond lCorpo lEnd
    codeBloco <- genBloco tab blocoLoop

    return (lTeste ++ ":\n" ++ codeCond ++ lCorpo ++ ":\n" ++ codeBloco ++ "\tgoto " ++ lTeste ++ "\n" ++ lEnd ++ ":\n")


genCmd _ _ = return ""


genOp :: Tipo -> String -> String
genOp TInt    op = "\ti" ++ op ++ "\n"
genOp TDouble op = "\td" ++ op ++ "\n"
genOp _       op = error ("[CodeGen] Operador '" ++ op ++ "' não suportado para este tipo.")

-- Gera a instrução correta para uma constante inteira.
genInt :: Int -> String
genInt i
    | i == -1               = "\ticonst_m1\n"
    | i >= 0 && i <= 5      = "\ticonst_" ++ show i ++ "\n" -- Atalho para i==0, i==1, etc.
    | i >= -128 && i <= 127 = "\tbipush " ++ show i ++ "\n"
    | i >= -32768 && i <= 32767 = "\tsipush " ++ show i ++ "\n"
    | otherwise             = "\tldc " ++ show i ++ "\n"

genRel :: String -> Tipo -> String -> String
genRel op TInt labelTrue =
    let instr = case op of
                    "==" -> "if_icmpeq"
                    "/=" -> "if_icmpne"
                    "<"  -> "if_icmplt"
                    "<=" -> "if_icmple"
                    ">"  -> "if_icmpgt"
                    ">=" -> "if_icmpge"
                    _    -> error "[CodeGen] Operador relacional desconhecido."
    in "\t" ++ instr ++ " " ++ labelTrue ++ "\n"

genRel op TDouble labelTrue =

    -- logica usada:
    -- 1 se valor1 > valor2
    -- 0 se valor1 == valor2
    -- -1 se valor1 < valor2
    
    let cmp_instr = "\tdcmpg\n"
        jump_instr = case op of
                        "==" -> "ifeq"
                        "/=" -> "ifne"
                        "<"  -> "iflt"
                        "<=" -> "ifle"
                        ">"  -> "ifgt"
                        ">=" -> "ifge"
                        _    -> error "[CodeGen] Operador relacional desconhecido para Double."

    in cmp_instr ++ "\t" ++ jump_instr ++" " ++ labelTrue ++ "\n"

genRel op TString labelTrue | op == "==" || op == "/=" = 
    let instr = case op of
                    "==" -> "if_acmpeq" --'acmp' signifca 'adress compare'
                    "/=" -> "if_acmpne"
    in "\t" ++ instr ++ " " ++ labelTrue ++ "\n"
genRel op TString _ = error ("[CodeGen] Operador relacional ' " ++ op ++ " ' não suportado para Strings.")

-- Caso de erro para outros tipos
genRel _ tipo _ = error ("[CodeGen] Comparações para o tipo " ++ show tipo ++ " ainda não implementadas.")

-- Gera código para um bloco de comandos
genBloco :: SymTab -> Bloco -> State Int String
genBloco symTab comandos = concat <$> mapM (genCmd symTab) comandos

genMainCab :: Int -> Int -> String
genMainCab s l = ".method public static main([Ljava/lang/String;)V\n\t.limit stack "++show s++"\n\t.limit locals "++show l++"\n\n"

genCabecalhoClasse :: [Char] -> [Char]
genCabecalhoClasse n = ".class public "++n++"\n.super java/lang/Object\n\n.method public <init>()V\n\taload_0\n\tinvokenonvirtual java/lang/Object/<init>()V\n\treturn\n.end method\n\n"

-- Gera o código para o método main
genMain :: [Var] -> Bloco -> State Int String
genMain varsGlobais blocoPrincipal = do
    let (symTab, proxIndice) = criarTabela varsGlobais 1  -- cria a tabela de simbolos a partir da lista de [Var]
    
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

    return (cabecalhoClasse ++ mainCode)

-- Função principal que será chamada por Main.hs
gerar :: String -> Programa -> String
gerar nomePrograma ast = fst $ runState (genProg nomePrograma ast) 0