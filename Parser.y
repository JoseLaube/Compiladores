{
module Parser where

import Token
import Ri
import qualified Lex as L

}

%name parsePrograma
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
  '{' {LBRACE} 
  '}' {RBRACE} 
  '=' {EQ_ASSIGN}
  ';' {SEMI}          
  '<=' {RLE}
  '>=' {RGE}  
  '>' {RGT}
  '<' {RLT}
  '==' {REQ}
  '&&' {AND}
  '||' {OR}
  '!' {NOT}
  ',' {COMMA}                 -- Adição da virgula
  Num {NUM $$}                -- Para literais Double (ex: 1.0, 0.5)
  IntLit {INT_LIT $$}         -- Para literais Int (ex: 10, 200)
  Id  {ID $$}
  StringLit {STRING_LIT $$}   -- Para literais string (ex: "Ola Mundo!")
  'int'    {KW_INT}
  'float'  {KW_FLOAT}
  'string' {KW_STRING}
  'void'   {KW_VOID}
  'read'   {KW_READ}
  'while'  {KW_WHILE}
  'print'  {KW_PRINT}
  'if'     {KW_IF}
  'return' {KW_RETURN}

%%
Programa : Bloco                 { Prog $1 } -- Um programa é apenas um Bloco Principal 

Bloco    : '{' ListaCmd '}'         { $2 }
            | '{' '}'               { [] } -- Bloco vazio (lista vazia de comandos)

ListaCmd    : ListaCmd Comando      { $2 : $1 } -- Constrói ao contrário, reverter se necessário
            | Comando               { [$1] }
            |                       { [] }      -- Lista de comandos vazia dentro das chaves

Comando  : 'while' '(' ExprL ')' Bloco     { While $3 $5 }      
         | Id '=' Expr ';'                 { Atrib $1 $3 }
         | 'read' '(' Id ')' ';'           { Leitura $3 }
         | 'print' '(' Expr ')' ';'        { Imp $3 }
         | 'if' '(' ExprL ')' Bloco Bloco  { If $3 $5 $6 } 
         | 'return' Expr ';'               { Ret (Just $2) }      -- tem que ter just por conta do (Maybe Expr)
         | 'return' ';'                    { Ret Nothing}
         | Id '(' ListaArgsExpr ')' ';'    { Proc $1 $3 }         -- id ( ListaArgsExpr ) ;
         | Id '(' ')' ';'                  { Proc $1 [] }         -- id () ;

-- Não-terminal para a lista de argumentos (expressões)
ListaArgsExpr : Expr                      { [$1] }            -- Um único argumento
              | ListaArgsExpr ',' Expr    { $3 : $1 }         -- Lista de argumentos (constrói ao contrário)

----------------------------------------------------------------------------
-- regras de expressao permanecem, mas não são o ponto de partida principal
-- Inico : Expr               {Left $1}  -- Expressao aritmetica
--      | ExprL              {Right $1} -- Expressao relacional ou logica
----------------------------------------------------------------------------

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
       | Id                 { IdVar $1 }
       | StringLit          { Lit $1 }
       | '(' Expr ')'       { $2 }    
       | '-' Factor         { Neg $2 }
       

{
parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do
  putStr "Programa: "
  s <- getLine
  let resultado = parsePrograma (L.alexScanTokens s) :: Programa
  print resultado
}