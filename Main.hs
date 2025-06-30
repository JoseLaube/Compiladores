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
    putStrLn "--- Teste de Analise Semantica ---"
    conteudo <- readFile "teste5.txt"
    putStrLn "Código Fonte:"
    putStrLn conteudo
    
    -- 2. Chamar o lexer e o parser
    let tokens = L.alexScanTokens conteudo
    let astInicial = parsePrograma tokens

    -- 3. Chamar nosso analisador semântico
    -- A função 'analisa' retorna um valor dentro da nossa Mônada SemanticM
    let resultadoSemantico = analisa astInicial
    
    -- Ler o Result e exibir os resultados (apenas para debug)
    putStrLn "\n--- Valor Bruto do Result ---"
    print resultadoSemantico

    case resultadoSemantico of
        Result (houveErro, mensagens, astFinal) -> do
            putStrLn "\n--- Mensagens do Analisador Semantico ---"
            if null mensagens
                then putStrLn "Nenhuma mensagem."
                else putStrLn mensagens
            
            putStrLn "\n--- AST Final (apos analise) ---"
            print astFinal
            
            putStrLn "\n--- Status Final ---"
            if houveErro
                then putStrLn "Compilação falhou devido a erros."
                else putStrLn "Análise semântica concluída com sucesso (pode conter avisos)."