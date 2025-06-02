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
  '/=' {RDF}
  '/' {DIV}
  '(' {LPAR}
  ')' {RPAR}
  '<=' {RLE}
  '>=' {RGE}  
  '>' {RGT}
  '<' {RLT}
  '==' {REQ}
  '&&' {AND}
  '||' {OR}
  '!' {NOT}
  Num {NUM $$}          -- Para literais Double (ex: 1.0, 0.5)
  IntLit {INT_LIT $$}   -- Para literais Int (ex: 10, 200)
  Id  {ID $$}
  KW_INT {KW_INT}
  KW_FLOAT {KW_FLOAT}
  KW_STRING {KW_STRING}
  KW_VOID {KW_VOID}

%%

Inico : Expr               {Left $1}  -- Expressao aritmetica
      | ExprL              {Right $1} -- Expressao relacional ou logica

ExprL : ExprL '||' ExprL      { Or $1 $3 }
      | ExprL '&&' ExprL      { And $1 $3 }
      | '!' ExprL             { Not $2 } 
      | ExprR                 { Rel $1 }  
      | '(' ExprL ')'         { $2 }    

ExprR : Expr '==' Expr       {Req $1 $3}
      | Expr '>' Expr	     {Rgt $1 $3}
      | Expr '<' Expr	     {Rlt $1 $3}
      | Expr '<=' Expr       {Rle $1 $3}
      | Expr '>=' Expr       {Rge $1 $3}
      | Expr '/=' Expr       {Rdf $1 $3} -- adicionei diferente

Expr  : Expr '+' Term       {Add $1 $3}
      | Expr '-' Term       {Sub $1 $3} 
      | Term                {$1}

Term  : Term  '*' Factor    {Mul $1 $3}
      | Term '/' Factor     {Div $1 $3}
      | Factor              {$1}

Factor : Num                { Const (CDouble $1) }
       | IntLit             { Const (CInt $1) }
       | Id                 {IdVar $1}
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
