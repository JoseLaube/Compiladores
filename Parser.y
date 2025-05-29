{
module Parser where

import Token
import Ri
import qualified Lex as L

}


%name calc
%tokentype { Token }
%error { parseError }
%token 
  '+' {ADD}
  '-' {SUB}
  '*' {MUL}
  '/' {DIV}
  '(' {LPAR}
  ')' {RPAR}
  '<=' {RLE}
  '>=' {RGE}  
  '>' {RGT}
  '<' {RLT}
  '==' {REQ}
  Num {NUM $$}


%%
Inico : Expr               {Left $1}
      | ExprR              {Right $1}
      
ExprR : Factor '==' Factor        {Req $1 $3}
      | Factor '>' Factor	  {Rgt $1 $3}
      | Factor '<' Factor	  {Rlt $1 $3}
      | Factor '<=' Factor        {Rle $1 $3}
      | Factor '>=' Factor        {Rge $1 $3}

Expr  : Expr '+' Term       {Add $1 $3}
      | Expr '-' Term       {Sub $1 $3} 
      | Term                {$1}

Term  : Term  '*' Factor    {Mul $1 $3}
      | Term '/' Factor     {Div $1 $3}
      | Factor              {$1}

Factor : Num                {Const $1}
       | '(' Expr ')'       {$2}    
       | '-' Factor         {Neg $2}
       


{
parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do putStr "Expressão:"
          s <- getLine
          case calc (L.alexScanTokens s) of
          	Left v -> print v
          	Right v -> print v
          	
}
