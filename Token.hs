module Token where

data Token
  = NUM Double
  | INT_LIT Int
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
  | AND
  | RDF
  | OR
  | NOT
  | ID String
  | KW_INT
  | KW_FLOAT
  | KW_STRING
  | KW_VOID
  deriving (Eq, Show)
  

