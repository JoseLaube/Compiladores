module Ri  where

data Expr = Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr | Neg Expr | IdVar String | Cint Int | Const Double deriving Show -- adicao

data ExprR = Rgt Expr Expr | Rlt Expr Expr |  Req Expr Expr | Rle Expr Expr | Rdf Expr Expr | Rge Expr Expr deriving Show

data ExprL = And ExprL ExprL | Or ExprL ExprL | Not ExprL | Rel ExprR deriving Show

