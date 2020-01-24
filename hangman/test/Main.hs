----------------------------------------------------------------------
-- |
--
-- Hangman (Tests)
--
-- To test your solution, run:
--
--   stack build hangman:test:spec
--
----------------------------------------------------------------------

module Main (main) where

-- hangman
import qualified Hangman ()

-- hspec
import qualified Test.Hspec as Hspec

main :: IO ()
main = putStrLn "hangman!"
