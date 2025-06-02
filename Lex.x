{
module Lex where

import Token
}

%wrapper "basic"

$digit = [0-9]        -- digits
$alpha = [a-zA-Z] 

@num_double = $digit+ \. $digit+ ($digit+)?
@num_int    = $digit+
@id  = $alpha ($alpha | $digit | \_ )*  

tokens :-

<0> $white+ ;
<0> "int"       {\s -> KW_INT}
<0> "float"     {\s -> KW_FLOAT}
<0> "string"    {\s -> KW_STRING}
<0> "void"      {\s -> KW_VOID}
<0> @id  {\s -> ID s}  -- adicao
<0> @num_double {\s -> NUM (read s)}      -- Renomeado de @num, retorna NUM Double
<0> @num_int    {\s -> INT_LIT (read s)}   -- Para inteiros, retorna INT_LIT Int
<0> "+" {\s -> ADD}  
<0> "-" {\s -> SUB}  
<0> "*" {\s -> MUL}
<0> "/=" {\s -> RDF}
<0> "/" {\s -> DIV}  
<0> "(" {\s -> LPAR}  
<0> ")" {\s -> RPAR} 
<0> "<=" {\n -> RLE}
<0> ">=" {\n -> RGE}
<0> ">" {\s -> RGT}
<0> "<" {\s -> RLT}
<0> "==" {\s -> REQ}
<0> "&&" {\s -> AND}
<0> "||" {\s -> OR}
<0> "!" {\s -> NOT}


{
-- As acoes tem tipo :: String -> Token

testLex = do s <- getLine
             print (alexScanTokens s)
}

