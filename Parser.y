{
module Parser where

import Token
import Ri
import qualified Lex as L

}


%name calc
%tokentype { Token }
%error { parseError }

%left OR AND 
%right NOT

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
  '&&' {AND}
  '||' {OR}
  '!' {NOT}
  Num {NUM $$}


%%
Inico : Expr               {Left $1}  -- Expressao aritmetica
      | ExprRL              {Right $1} -- Expressao relacional ou logica

ExprRL : ExprR         {Left $1}   -- Expressao relacional
       | ExprL         {Right $1}  -- Expressao logica

ExprL : ExprL '||' ExprL        { Or $1 $3 }
      | ExprL '&&' ExprL       { And $1 $3 }
      | '!' ExprL             { Not $2 } 
      | ExprR                 { Rel $1 }  
      | '(' ExprL ')'         { $2 }    

ExprR : Expr '==' Expr        {Req $1 $3}
      | Expr '>' Expr	  {Rgt $1 $3}
      | Expr '<' Expr	  {Rlt $1 $3}
      | Expr '<=' Expr        {Rle $1 $3}
      | Expr '>=' Expr        {Rge $1 $3}

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

type CalcReturnType = Either Expr (Either ExprR ExprL)

main = do
  putStr "Expressão:"
  s <- getLine
  -- Adicionar uma anotação de tipo explícita para o resultado de 'calc'
  let result = calc (L.alexScanTokens s) :: CalcReturnType
  case result of
    Left arit_val -> do
      putStr "Resultado (Aritmético): "
      print arit_val
    Right either_rel_log -> case either_rel_log of
      Left rel_val -> do
        putStr "Resultado (Relacional): "
        print rel_val
      Right log_val -> do
        putStr "Resultado (Lógico): "
        print log_val
          	
}
