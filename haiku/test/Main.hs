----------------------------------------------------------------------
-- |
--
-- Haiku (Tests)
--
-- To test your solution, run:
--
--   stack build haiku:test:spec
--
----------------------------------------------------------------------

module Main (main) where

-- haiku
import qualified Haiku ()

-- hspec
import qualified Test.Hspec as Hspec

main :: IO ()
main = putStrLn "haiku!"
