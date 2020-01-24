----------------------------------------------------------------------
-- |
--
-- Luhn (Tests)
--
-- To test your solution, run:
--
--   stack build luhn:test:spec
--
----------------------------------------------------------------------

module Main (main) where

-- hspec
import qualified Test.Hspec as Hspec

-- luhn
import qualified Luhn

main :: IO ()
main =
  Hspec.hspec $ do
    Hspec.describe "toDigits" $ do
      Hspec.it "splits numbers in digits when the given number is positive" $
        Luhn.toDigits 1234 `Hspec.shouldBe` [1, 2, 3, 4]
      Hspec.it "returns an empty list when the given number is zero" $
        Luhn.toDigits 0 `Hspec.shouldBe` []
      Hspec.it "returns an empty list when the given number is negative" $
        Luhn.toDigits (-17) `Hspec.shouldBe` []
    Hspec.describe "doubleEveryOther" $ do
      Hspec.it "doubles every other number when there is an even number of numbers" $
        Luhn.doubleEveryOther [8, 7, 6, 5] `Hspec.shouldBe` [16, 7, 12, 5]
      Hspec.it "doubles every other number when there's an odd number of numbers" $
        Luhn.doubleEveryOther [1, 2, 3] `Hspec.shouldBe` [1, 4, 3]
    Hspec.describe "sumDigits" $
      Hspec.it "sums all digits" $
        Luhn.sumDigits [16, 7, 12, 5] `Hspec.shouldBe` 22
    Hspec.describe "validate" $ do
      Hspec.it "succeeds for a valid credit card number" $
        Luhn.validate 4012888888881881 `Hspec.shouldBe` True
      Hspec.it "fails for an invalid credit card number" $
        Luhn.validate 4012888888881882 `Hspec.shouldBe` False
