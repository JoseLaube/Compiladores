module Ri  where

data Expr = Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr | Neg Expr | Const Double deriving Show

data ExprR = Rgt Expr Expr | Rlt Expr Expr |  Req Expr Expr | Rle Expr Expr | Rge Expr Expr deriving Show

