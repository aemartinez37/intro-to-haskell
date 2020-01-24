----------------------------------------------------------------------
-- |
--
-- Experiments (Tests)
--
-- To test your experiments, run:
--
--   stack build experiments:test:spec
--
----------------------------------------------------------------------

module Main (main) where

-- experiments
import qualified Experiments ()

-- hspec
import qualified Test.Hspec as Hspec

main :: IO ()
main =
  Hspec.hspec $
    Hspec.describe "Experiments" $
      Hspec.it "experiment #1" $
        True `Hspec.shouldBe` True
