module Main (main) where

-- experiments
import qualified Experiments ()

-- hspec
import qualified Test.Hspec as Hspec

main :: IO ()
main =
  Hspec.hspec $
    Hspec.describe "Experiments" $
      Hspec.it "" $
        True `Hspec.shouldBe` True
