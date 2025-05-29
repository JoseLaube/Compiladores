module Token where

data Token
  = NUM Double
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
  deriving (Eq, Show)
  
