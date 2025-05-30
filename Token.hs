module Token where

data Token
  = NUMI Int -- adicao
  | NUM Double
  | ADD
  | SUB
  | MUL
  | DIV
  | LPAR
  | RPAR
  | RGT
  | RLT
  | REQ
  | RLE
  | RGE
  | RDF
  | AND
  | OR
  | NOT
  | ID String 
  deriving (Eq, Show)
  
