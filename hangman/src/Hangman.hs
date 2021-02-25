----------------------------------------------------------------------
-- |
--
-- Hangman
--
-- To build your solution, run:
--
--   stack build komatsu:lib
--
----------------------------------------------------------------------

module Hangman where

import System.IO  
import System.Directory  
import Data.List
import System.Random
import Control.Monad
import System.Process

hangman :: IO()
hangman = do
    gen <- getStdGen
    handleWordsFile <- openFile "/usr/share/dict/words" ReadMode
    contents <- hGetContents handleWordsFile
    let randomWord = getRandomWord gen contents
    hangmanControl randomWord ""


getRandomWord :: System.Random.RandomGen g => g -> [Char] -> String
getRandomWord gen contents =      
    let words = lines contents     
        randomWordIndex = (randomRs (0, length words) gen) !! 0
        number = randomWordIndex     
        randomWord = words !! number
    in randomWord


hangmanString :: Foldable t => [Char] -> t Char -> [Char]
hangmanString word chars = map (\x ->  if x `elem` chars then x else '*') word

hangmanControl :: [Char] -> [Char] -> IO ()
hangmanControl word chars = do
    clearScreen
    let hiddenWord = hangmanString word chars
    if word /= hiddenWord  
        then do
            putStrLn "\n"
            putStrLn $ "(" ++ word ++ ") Hangman string: " ++ hiddenWord
            putStrLn "\nEnter a new character: "
            l <- getLine
            hangmanControl word (chars ++ l)
        else do
            putStrLn "\n"
            putStrLn $ "Hangman string: " ++ hiddenWord
            putStrLn "\n***** YOU WIN! *****\n"
            return ()

clearScreen :: IO ()
clearScreen = do
  system "clear"
  return ()