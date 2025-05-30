# Compilador para Linguagem Simples (1ª Etapa)

Este repositório contém a primeira etapa do desenvolvimento de um compilador, como parte da disciplina de Compiladores da UDESC (Universidade do Estado de Santa Catarina). O objetivo final do trabalho completo é a implementação de um compilador que gere *bytecodes Java* (utilizando Jasmin) para uma linguagem de programação simples especificada.

A primeira etapa foca na implementação do **analisador léxico** e **analisador sintático** da linguagem, capazes de reconhecer expressões aritméticas, relacionais e lógicas, e construir uma Árvore Sintática Abstrata (AST) parcial.

## Desenvolvedores

*   José Augusto Laube
*   Gustavo de Souza

## Estrutura dos Arquivos

O projeto está organizado nos seguintes arquivos principais:

*   **`Ri.hs`**:
    *   **Descrição**: Define as estruturas de dados em Haskell para a Árvore Sintática Abstrata (AST) da linguagem. Isso inclui tipos para representar expressões aritméticas (`Expr`), expressões relacionais (`ExprR`), e expressões lógicas (`ExprL`).
    *   **Conteúdo Principal**: Definições dos tipos de dados `Expr`, `ExprR`, `ExprL` e seus construtores.

*   **`Token.hs`**:
    *   **Descrição**: Define os tipos de tokens que são reconhecidos pelo analisador léxico. Cada token representa uma unidade lexical fundamental da linguagem (ex: número, operador, identificador).
    *   **Conteúdo Principal**: Definição do tipo de dado `Token` e seus construtores (e.g., `NUM`, `ADD`, `ID`, `AND`).

*   **`Lex.x`**:
    *   **Descrição**: Contém as regras para o analisador léxico, escritas na sintaxe da ferramenta Alex. Define como sequências de caracteres do código fonte são convertidas em tokens (definidos em `Token.hs`).
    *   **Conteúdo Principal**: Expressões regulares para reconhecer números, identificadores, operadores e outros símbolos, e as ações para gerar os tokens correspondentes.

*   **`Parser.y`**:
    *   **Descrição**: Contém as regras gramaticais da linguagem, escritas na sintaxe da ferramenta Happy. Define a estrutura sintática da linguagem, ou seja, como os tokens podem ser combinados para formar construções válidas (como expressões). Também inclui as ações semânticas para construir a AST (definida em `Ri.hs`) a partir das regras reconhecidas.
    *   **Conteúdo Principal**: Definição da gramática BNF da linguagem, precedência e associatividade de operadores, e ações para construção da AST. Inclui uma função `main` para testar o parser.

## Objetivos da Primeira Etapa

*   Implementar um analisador léxico (usando Alex) capaz de tokenizar a entrada.
*   Implementar um analisador sintático (usando Happy) capaz de validar a estrutura de expressões aritméticas, relacionais e lógicas.
*   Construir uma representação em Árvore Sintática Abstrata (AST) para as expressões reconhecidas.
*   Lidar corretamente com a precedência e associatividade dos operadores.
*   Reconhecer identificadores como parte das expressões.

## Pré-requisitos e Instalação (Linux Ubuntu)

Para compilar e executar este projeto, você precisará das seguintes ferramentas:

1.  **GHC (Glasgow Haskell Compiler)**: O compilador para a linguagem Haskell.
2.  **Alex**: Um gerador de analisadores léxicos para Haskell.
3.  **Happy**: Um gerador de analisadores sintáticos para Haskell.

**Instruções de Instalação no Ubuntu:**

```bash
# Atualizar lista de pacotes
sudo apt update

# Instalar GHC (Glasgow Haskell Compiler)
sudo apt install ghc

# Instalar Alex e Happy
# Essas ferramentas são geralmente empacotadas como 'alex' e 'happy' nos repositórios do Ubuntu.
sudo apt install alex happy
```

## Como Compilar e Executar

1. **Gere os arquivos Haskell a partir do Alex e Happy:**
Navegue até o diretório do projeto no terminal e execute:

```bash
alex Lex.x      # Isso gerará o arquivo Lex.hs
happy Parser.y  # Isso gerará o arquivo Parser.hs
ghci Parser.hs  # Isso executará o Parser.hs criado
```
2. **Teste:**
O programa solicitará que você digite uma expressão. Após digitar "main", o programa solicitará uma expressão, ao inseri-la e pressionar Enter o programa imprimirá a representação da Árvore Sintática Abstrata (AST) correspondente, ou uma mensagem de erro de parsing se a expressão for inválida.
Experimente com expressões como:

```bash
1 + 2 * 3
x - (y / 2)
a > b && c <= 10
!(var1 == var2 || pronto)
-(5 + z) * 10
```
