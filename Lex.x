{
module Lex where

import Token
}

%wrapper "basic"

$digit = [0-9]          -- digits
@num = $digit+(\.$digit+)?

tokens :-

<0> $white+ ;
<0> @num {\s -> NUM (read s)}
<0> "+" {\s -> ADD}  
<0> "-" {\s -> SUB}  
<0> "*" {\s -> MUL}  
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
