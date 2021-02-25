----------------------------------------------------------------------
-- |
--
-- Hangman (Executable)
--
-- To run:
--
--   stack build hangman:exe:hangman --exec hangman
--
----------------------------------------------------------------------

module Main (main) where
import Hangman (hangman)

main :: IO ()
main =
    hangman
