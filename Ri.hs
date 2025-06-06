module Ri  where

type Id = String

data Tipo = TDouble | TInt | TString | TVoid deriving (Show, Eq)

data TCons = CDouble Double | CInt Int deriving Show

data Expr = Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr | Neg Expr | IdVar String | Lit String | Const TCons deriving Show -- adicao

data ExprR = Rgt Expr Expr | Rdf Expr Expr | Rlt Expr Expr | Req Expr Expr | Rle Expr Expr | Rge Expr Expr deriving Show

data ExprL = And ExprL ExprL | Or ExprL ExprL | Not ExprL | Rel ExprR deriving Show

data Var = Variable Id Tipo deriving Show

type Bloco = [Comando]

data Programa = Prog [Var] Bloco deriving Show

data Comando = If ExprL Bloco Bloco | While ExprL Bloco | Leitura Id | Imp Expr | Ret (Maybe Expr) | Proc Id [Expr] | Atrib String Expr deriving Show