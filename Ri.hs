module Ri  where

data Tipo = TDouble | TInt | TString | TVoid deriving (Show, Eq)

data TCons = CDouble Double | CInt Int deriving Show

data Expr = Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr | Neg Expr | IdVar String | Const TCons deriving Show -- adicao

data ExprR = Rgt Expr Expr | Rdf Expr Expr | Rlt Expr Expr | Req Expr Expr | Rle Expr Expr | Rge Expr Expr deriving Show

data ExprL = And ExprL ExprL | Or ExprL ExprL | Not ExprL | Rel ExprR deriving Show

-- data Var = Id :#: (Tipo, Int) deriving Show
