----------------------------------------------------------------------
-- |
--
-- Komatsu (Tests)
--
-- To test your solution, run:
--
--   stack build komatsu:test:spec
--
----------------------------------------------------------------------

module Main (main) where

-- QuickCheck
import qualified Test.QuickCheck as QuickCheck

-- base
import qualified Data.List as List

-- hspec
import qualified Test.Hspec as Hspec
import qualified Test.Hspec.QuickCheck as HspecQuickCheck

-- komatsu
import qualified Komatsu

main :: IO ()
main =
  Hspec.hspec $ do
    Hspec.describe "skips:" $ do
      Hspec.it "skips \"ABCD\" == ..." $
        Komatsu.skips "ABCD" `Hspec.shouldBe` ["ABCD", "BD", "C", "D"]
      Hspec.it "skips \"hello!\" == ..." $
        Hspec.shouldBe
          (Komatsu.skips "hello!")
          ["hello!", "el!", "l!", "l", "o", "!"]
      Hspec.it "skips [] == []" $
        Komatsu.skips ([] :: [Int]) `Hspec.shouldBe` []
      Hspec.it "skips [1] == [[1]]" $
        Komatsu.skips ([1] :: [Int]) `Hspec.shouldBe` [[1]]
      Hspec.it "skips [1, 2] == [[1, 2], [2]]" $
        Komatsu.skips ([1, 2] :: [Int]) `Hspec.shouldBe` [[1, 2], [2]]
    Hspec.describe "histogram:" $ do
      Hspec.it "histogram [1, 1, 1, 5] == ..." $
        Hspec.shouldBe
          (Komatsu.histogram [1, 1, 1, 5])
          " *        \n *        \n *   *    \n==========\n0123456789\n"
      Hspec.it "histogram [1, 4, 5, 4, 6, 6, 3, 4, 2, 4, 9] == ..." $
        Hspec.shouldBe
          (Komatsu.histogram [1, 4, 5, 4, 6, 6, 3, 4, 2, 4, 9])
          "    *     \n    *     \n    * *   \n ******  *\n==========\n0123456789\n"
    Hspec.describe "sieveSundaram:" $ do
      Hspec.it "sieveSundaram 0 == []" $
        Komatsu.sieveSundaram 0 `Hspec.shouldBe` []
      Hspec.it "sieveSundaram 1 == [3]" $
        Komatsu.sieveSundaram 1 `Hspec.shouldBe` [3]
      Hspec.it "sieveSundaram 2 [3, 5]" $
        Komatsu.sieveSundaram 2 `Hspec.shouldBe` [3, 5]
      Hspec.it "sieveSundaram 3 == [3, 5, 7]" $
        Komatsu.sieveSundaram 3 `Hspec.shouldBe` [3, 5, 7]
      Hspec.it "sieveSundaram 4 == [3, 5, 7]" $
        Komatsu.sieveSundaram 4 `Hspec.shouldBe` [3, 5, 7]
      Hspec.it "sieveSundaram 5 == [3, 5, 7, 11]" $
        Komatsu.sieveSundaram 5 `Hspec.shouldBe` [3, 5, 7, 11]
      Hspec.it "sieveSundaram 10 == [3, 5, 7, 11, 13, 17, 19]" $
        Komatsu.sieveSundaram 10 `Hspec.shouldBe` [3, 5, 7, 11, 13, 17, 19]
    Hspec.describe "myLast:" $ do
      Hspec.it "myLast [] == Nothing" $
        Komatsu.myLast ([] :: [Int]) `Hspec.shouldBe` Nothing
      Hspec.it "myLast [1..5] == Just 5" $
        Komatsu.myLast ([1..5] :: [Int]) `Hspec.shouldBe` Just 5
      HspecQuickCheck.prop "myLast == last" $
        \(QuickCheck.NonEmpty xs) ->
          Komatsu.myLast (xs :: [Int]) == Just (last xs)
    Hspec.describe "myLength:" $ do
      Hspec.it "myLength [] == 0" $
        Komatsu.myLength ([] :: [Int]) `Hspec.shouldBe` 0
      Hspec.it "myLength [1..5] == 5" $
        Komatsu.myLength ([1..5] :: [Int]) `Hspec.shouldBe` 5
      HspecQuickCheck.prop "myLength == length" $
        \xs ->
          Komatsu.myLength (xs :: [Int]) == length xs
    Hspec.describe "myReverse:" $ do
      Hspec.it "myReverse [] == []" $
        Komatsu.myReverse ([] :: [Int]) `Hspec.shouldBe` []
      Hspec.it "myReverse [1..5] == [5,4..1]" $
        Komatsu.myReverse ([1..5] :: [Int]) `Hspec.shouldBe` [5, 4..1]
      HspecQuickCheck.prop "myReverse == reverse" $
        \xs ->
          Komatsu.myReverse (xs :: [Int]) == reverse xs
    Hspec.describe "compress:" $ do
      Hspec.it "compress [] == []" $
        Komatsu.compress "" `Hspec.shouldBe` ""
      Hspec.it "compress \"wwwbwwbbwbbb\" == \"wbwbwb\"" $
        Komatsu.compress "wwwbwwbbwbbb" `Hspec.shouldBe` "wbwbwb"
    Hspec.describe "myGroup:" $ do
      Hspec.it "myGroup [] == []" $
        Komatsu.myGroup "" `Hspec.shouldBe` []
      Hspec.it "myGroup \"wwwbwwbbwbbb\" == ..." $
        Hspec.shouldBe
          (Komatsu.myGroup "wwwbwwbbwbbb")
          ["www", "b", "ww", "bb", "w", "bbb"]
      HspecQuickCheck.prop "myGroup == group" $
        \xs ->
          Komatsu.myGroup (xs :: [Int]) == List.group xs
    Hspec.describe "encode:" $ do
      Hspec.it "encode [] == []" $
        Komatsu.encode "" `Hspec.shouldBe` []
      Hspec.it "encode \"wwwbwwbbwbbb\" == ..." $
        Hspec.shouldBe
          (Komatsu.encode "wwwbwwbbwbbb")
          [(3, 'w'), (1, 'b'), (2, 'w'), (2, 'b'), (1, 'w'), (3, 'b')]
    Hspec.describe "decode:" $ do
      Hspec.it "decode [] == []" $
        Komatsu.decode [] `Hspec.shouldBe` ""
      Hspec.it "decode (encode \"wwwbwwbbwbbb\") == \"wwwbwwbbwbbb\"" $
        Hspec.shouldBe
          (Komatsu.decode (Komatsu.encode "wwwbwwbbwbbb"))
          "wwwbwwbbwbbb"
