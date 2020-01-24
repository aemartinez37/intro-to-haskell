module Main (main) where

-- hspec
import qualified Test.Hspec as Hspec
import qualified Test.Hspec.QuickCheck as Hspec

-- komatsu
import qualified Komatsu

main :: IO ()
main =
  Hspec.hspec $ do
    Hspec.describe "skips" $ do
      Hspec.it "" $
        Komatsu.skips "ABCD" `Hspec.shouldBe` ["ABCD", "BD", "C", "D"]
      Hspec.it "" $
        Komatsu.skips "hello!" `Hspec.shouldBe` ["hello!", "el!", "l!", "l", "o", "!"]
      Hspec.it "" $
        Komatsu.skips ([1] :: [Int]) `Hspec.shouldBe` [[1]]
      Hspec.it "" $
        Komatsu.skips [True, False] `Hspec.shouldBe` [[True, False], [False]]
      Hspec.it "" $
        Komatsu.skips ([] :: [Int]) `Hspec.shouldBe` []
    Hspec.describe "histogram" $
      Hspec.it "" $
        False `Hspec.shouldBe` False
    Hspec.describe "sieveSundaram" $ do
      Hspec.it "" $
        Komatsu.sieveSundaram 0 `Hspec.shouldBe` []
      Hspec.it "" $
        Komatsu.sieveSundaram 1 `Hspec.shouldBe` [3]
      Hspec.it "" $
        Komatsu.sieveSundaram 2 `Hspec.shouldBe` [3,5]
      Hspec.it "" $
        Komatsu.sieveSundaram 3 `Hspec.shouldBe` [3,5,7]
      Hspec.it "" $
        Komatsu.sieveSundaram 4 `Hspec.shouldBe` [3,5,7]
      Hspec.it "" $
        Komatsu.sieveSundaram 5 `Hspec.shouldBe` [3,5,7,11]
      Hspec.it "" $
        Komatsu.sieveSundaram 10 `Hspec.shouldBe` [3,5,7,11,13,17,19]
    Hspec.describe "myLast" $
      Hspec.prop "" $
        \xs -> Komatsu.myLast xs == last (xs :: [Int])
    Hspec.describe "myLength" $
      Hspec.it "" $
        True `Hspec.shouldBe` True
    Hspec.describe "myReverse" $
      Hspec.prop "" $
        \xs -> Komatsu.myReverse xs == reverse (xs :: [Int])
    Hspec.describe "compress" $
      Hspec.it "" $
        True `Hspec.shouldBe` True
    Hspec.describe "myGroup" $
      Hspec.it "" $
        True `Hspec.shouldBe` True
    Hspec.describe "encode" $
      Hspec.it "" $
        True `Hspec.shouldBe` True
    Hspec.describe "decode" $
      Hspec.it "" $
        True `Hspec.shouldBe` True
