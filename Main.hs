-- Em Main.hs
module Main where

import Ri
import Token
import Parser  -- Seu parser gerado pelo Happy
import Semantic -- Nosso novo módulo de análise semântica
import qualified Lex as L -- Seu lexer gerado pelo Alex

main :: IO ()
main = do
    -- 1. Ler o código de um arquivo de teste
    putStrLn "--- Teste de Análise Semântica ---"
    conteudo <- readFile "teste5.txt"
    putStrLn "Código Fonte:"
    putStrLn conteudo
    
    -- 2. Chamar o lexer e o parser
    let tokens = L.alexScanTokens conteudo
    let astInicial = parsePrograma tokens

    -- 3. Chamar nosso analisador semântico
    -- A função 'analisa' retorna um valor dentro da nossa Mônada SemanticM
    let resultadoSemantico = analisa astInicial
    
    -- 4. Extrair e imprimir os resultados
    -- Usamos um 'case' para desempacotar o resultado da Mônada
    case resultadoSemantico of
        Sem (mensagens, astFinal) -> do
            putStrLn "\n--- Mensagens do Analisador Semântico ---"
            if null mensagens
                then putStrLn "Nenhuma mensagem."
                else putStrLn mensagens
            
            putStrLn "\n--- AST Final (após análise) ---"
            print astFinal