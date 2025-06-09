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
  NUM {NUM $$}                -- Para literais Double (ex: 1.0, 0.5)
  INT_LIT {INT_LIT $$}         -- Para literais Int (ex: 10, 200)
  ID  {ID $$}
  STRING_LIT {STRING_LIT $$}   -- Para literais string (ex: "Ola Mundo!")
  
  -- palavras reservadas
  'int'    {KW_INT}
  'float'  {KW_FLOAT}
  'string' {KW_STRING}
  'void'   {KW_VOID}
  'read'   {KW_READ}
  'while'  {KW_WHILE}
  'print'  {KW_PRINT}
  'if'     {KW_IF}
  'else'     {KW_ELSE}
  'return' {KW_RETURN}

%%
Programa : ListaFuncoes BlocoPrincipal    { Prog $1 (fst $2) (snd $2) } -- fst extrai o segundo componente ([Var]) e snd extrai (Bloco)
         | BlocoPrincipal                 { Prog [] (fst $1) (snd $1) } -- Sem funções

ListaFuncoes : ListaFuncoes Funcao       { $2 : $1 } -- Constrói ao contrário
             | Funcao                    { [$1] }
             |                           { [] }      -- Retorna uma lista vazia de Funcao
      
Funcao : TipoRetorno ID '(' DeclParametros ')' BlocoPrincipal { ($2 :->: ( (reverse $4), $1, (snd $6)) ) }
       | TipoRetorno ID '(' ')' BlocoPrincipal                { ($2 :->: ( [], $1, (snd $5)) ) }

TipoRetorno : Tipo    { $1 }
            | 'void'  { TVoid }

DeclParametros : DeclParametros ',' Parametro      { $3 : $1 }
               | Parametro                         { [$1] }
               |                                   { [] }
               
Parametro : Tipo ID   { (:#:) $2 ($1,0) }


BlocoPrincipal : '{' Declaracoes ListaCmd '}'   { ($2, $3) }
               | '{' ListaCmd '}'               { ([], $2 ) }
 
Declaracoes : Declaracoes Declaracao  { $2 ++ $1 }
            | Declaracao              { $1 }
            |                         { [] }
            
Declaracao: Tipo ListaID ';'   { map (\idName -> (:#:) idName ($1,0) ) (reverse $2) }

Tipo : 'int'         { TInt }
     | 'float'       { TDouble }
     | 'string'      { TString }

ListaID  : ID               { [$1] }
         | ListaID ',' ID   { $3 : $1 }

Bloco : '{' ListaCmd '}'      { $2 }
      | '{' '}'               { [] }

ListaCmd    : ListaCmd Comando      { $2 : $1 }
            | Comando               { [$1] }
            |                       { [] }

Comando  : CmdSe                           { $1 }
         | CmdEscrita                      { $1 }
         | CmdAtrib                        { $1 }
         | CmdEnquanto                     { $1 }
         | CmdLeitura                      { $1 }
         | ChamadaProc                     { $1 }
         | Retorno                         { $1 }

Retorno : 'return' Expr ';'               { Ret (Just $2) }
        | 'return' ';'                    { Ret Nothing }

CmdSe : 'if' '(' ExprL ')' Bloco 'else' Bloco  { If $3 $5 $7 }
      | 'if' '(' ExprL ')' Bloco               { If $3 $5 [] }

CmdEnquanto : 'while' '(' ExprL ')' Bloco     { While $3 $5 }
         
CmdAtrib : ID '=' Expr ';'                 { Atrib $1 $3 }

CmdEscrita : 'print' '(' Expr ')' ';'        { Imp $3 }

CmdLeitura : 'read' '(' ID ')' ';'           { Leitura $3 }

ChamadaProc : ChamadaFuncao ';'  {Proc (fst $1) (snd $1) }

ChamadaFuncao : ID '(' ListaParametros ')'    { ($1,$3) }
              | ID '(' ')'                  { ($1,[]) }

ListaParametros : ListaParametros ',' Expr    { $1 ++ [$3] }
                | Expr                      { [$1] }

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
      | Expr '/=' Expr       {Rdf $1 $3}

Expr  : Expr '+' Term       {Add $1 $3}
      | Expr '-' Term       {Sub $1 $3}
      | Term                {$1}

Term  : Term  '*' Factor    {Mul $1 $3}
      | Term '/' Factor     {Div $1 $3}
      | Factor              {$1}

Factor : NUM                         { Const (CDouble $1) }
       | INT_LIT                     { Const (CInt $1) }
       | ID                          { IdVar $1 }
       | STRING_LIT                  { Lit $1 }
       | '(' Expr ')'                { $2 }
       | '-' Factor                  { Neg $2 }
       | ID '(' ListaParametros ')'  { Chamada $1 $3 }
       | ID '(' ')'                  { Chamada $1 [] }

{
parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do
  putStr "Programa: "
  s <- getLine
  let resultado = parsePrograma (L.alexScanTokens s) :: Programa
  print resultado
}