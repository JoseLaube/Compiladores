-- Main.hs
module Main where

import Ri
import Token
import Parser  -- Seu parser gerado pelo Happy
import Semantic -- Seu módulo de análise semântica
import GenCode  -- Importa o novo módulo de geração de código
import qualified Lex as L -- Seu lexer gerado pelo Alex

import System.FilePath (takeBaseName, (-<.>)) -- Para manipular nomes de arquivos

main :: IO ()
main = do
    -- O trabalho da 'main' agora é simplesmente iniciar o processo de compilação
    -- com o arquivo que você quer testar.
    putStrLn "--- INICIANDO COMPILADOR ---"
    compilarArquivo "teste5.txt" -- <<< CHAMANDO A FUNÇÃO DE COMPILAÇÃO
    putStrLn "--- FIM DA EXECUÇÃO ---"

-- Função principal que encapsula TODA a lógica de compilação
compilarArquivo :: FilePath -> IO ()
compilarArquivo filePath = do
    putStrLn "========================================="
    putStrLn $ "DEBUG: Iniciando compilação de: " ++ filePath
    
    conteudo <- readFile filePath
    
    putStrLn "DEBUG: Arquivo lido. Chamando o lexer..."
    let tokens = L.alexScanTokens conteudo
    
    putStrLn "DEBUG: Lexer concluído. Chamando o parser..."
    -- A linha a seguir pode travar se houver um erro de sintaxe!
    let astInicial = parsePrograma tokens 
    
    putStrLn "DEBUG: Parser concluído. Chamando a análise semântica..."
    let Result (houveErro, mensagens, astAnalisada) = analisa astInicial
    
    putStrLn "DEBUG: Análise semântica concluída. Verificando resultados..."
    
    putStrLn "\n--- Mensagens do Analisador Semântico ---"
    if null mensagens
        then putStrLn "Nenhuma mensagem."
        else putStrLn mensagens
    
    -- Verificamos o booleano de erro
    if houveErro then do
        putStrLn "\nDEBUG: 'houveErro' é True. Abortando."
        putStrLn "Compilação interrompida devido a erros semânticos."
    else do
        putStrLn "\nDEBUG: 'houveErro' é False. Prosseguindo para a geração de código."
        let nomeBase = takeBaseName filePath
        let codigoJasmin = gerar nomeBase astAnalisada
        
        putStrLn "DEBUG: Geração de código concluída. Salvando arquivo..."
        let outputFileName = nomeBase -<.> "j"
        writeFile outputFileName codigoJasmin
        
        putStrLn $ "\nCompilação concluída com sucesso!"
        putStrLn $ "Código Jasmin salvo em: " ++ outputFileName
    
    putStrLn "========================================="