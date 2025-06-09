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

  -- simbolos para expressoes
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
  ',' {COMMA}

  -- para tipos
  NUM {NUM $$}
  INT_LIT {INT_LIT $$}
  ID  {ID $$}
  STRING_LIT {STRING_LIT $$}

  -- palavras reservadas
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

-- LINHA CORRIGIDA AQUI
Programa : BlocoPrincipal { let (funs, declsList, cmds) = $1 in Prog funs (concat declsList) cmds }

BlocoPrincipal : '{' OptionalFuncoes OptionalDeclaracoes OptionalListaCmd '}' { ($2, $3, $4) }

-- REGRAS DE LISTA - AGORA COM RECURSÃO À ESQUERDA
Funcoes : Funcoes Funcao { $1 ++ [$2] } -- Concatena a nova função ao final da lista
        | Funcao         { [$1] }     -- Caso base: uma única função (convertida para lista)

Declaracoes : Declaracoes Declaracao { $1 ++ [$2] } -- Concatena a nova declaração ao final da lista
            | Declaracao             { [$1] }     -- Caso base: uma única declaração (convertida para lista)

ListaCmd : ListaCmd Comando { $1 ++ [$2] } -- Concatena o novo comando ao final da lista
         | Comando          { [$1] }     -- Caso base: um único comando (convertido para lista)

-- NOVAS REGRAS OPCIONAIS (mantidas como antes)
OptionalFuncoes : Funcoes { $1 }
                |         { [] }

OptionalDeclaracoes : Declaracoes { $1 }
                    |             { [] }

OptionalListaCmd : ListaCmd { $1 }
                 |          { [] }

-- Resto das regras permanecem as mesmas
Funcao : Tipo ID '(' Parametros ')' Bloco { (:->:) $2 ($4, $1) }

Parametros : ListaParametro { $1 }
           |                { [] }

ListaParametro : Parametro              { [$1] }
               | Parametro ',' ListaParametro { $1 : $3 }

Parametro : Tipo ID { (:#:) $2 ($1, 0) }

Declaracao : Tipo ListaId ';' { map (\idName -> (:#:) idName ($1, 0)) $2 }

Tipo : 'int'    { TInt }
     | 'float'  { TDouble }
     | 'string' { TString }
     | 'void'   { TVoid }

ListaId : ID ',' ListaId    { $1 : $3 }
        | ID                { [$1] }

Bloco : '{' ListaCmd '}' { $2 }
      | '{' '}'          { [] }

Comando : 'while' '(' ExprL ')' Bloco        { While $3 $5 }
        | ID '=' Expr ';'                    { Atrib $1 $3 }
        | 'read' '(' ID ')' ';'              { Leitura $3 }
        | 'print' '(' Expr ')' ';'           { Imp $3 }
        | 'if' '(' ExprL ')' Bloco Bloco     { If $3 $5 $6 }
        | 'return' Expr ';'                  { Ret (Just $2) }
        | 'return' ';'                       { Ret Nothing }
        | ID '(' ListaArgsExpr ')' ';'       { Proc $1 $3 }
        | ID '(' ')' ';'                     { Proc $1 [] }

ListaArgsExpr : Expr                { [$1] }
              | Expr ',' ListaArgsExpr { $1 : $3 }

ExprL : ExprL '||' ExprL { Or $1 $3 }
      | ExprL '&&' ExprL { And $1 $3 }
      | '!' ExprL        { Not $2 }
      | ExprR            { Rel $1 }
      | '(' ExprL ')'    { $2 }

ExprR : Expr '==' Expr {Req $1 $3}
      | Expr '>' Expr  {Rgt $1 $3}
      | Expr '<' Expr  {Rlt $1 $3}
      | Expr '<=' Expr {Rle $1 $3}
      | Expr '>=' Expr {Rge $1 $3}
      | Expr '/=' Expr {Rdf $1 $3}

Expr  : Expr '+' Term  {Add $1 $3}
      | Expr '-' Term  {Sub $1 $3}
      | Term           {$1}

Term  : Term '*' Factor {Mul $1 $3}
      | Term '/' Factor {Div $1 $3}
      | Factor          {$1}

Factor : NUM           { Const (CDouble $1) }
       | INT_LIT       { Const (CInt $1) }
       | ID            { IdVar $1 }
       | STRING_LIT    { Lit $1 }
       | '(' Expr ')'  { $2 }
       | '-' Factor    { Neg $2 }

{
parseError :: [Token] -> a
parseError s = error ("Parse error: " ++ show s)

main = do
  putStr "Programa: "
  s <- getLine
  let resultado = parsePrograma (L.alexScanTokens s) :: Programa
  print resultado
}