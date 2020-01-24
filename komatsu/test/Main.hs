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

{-# LANGUAGE ScopedTypeVariables #-}

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
    Hspec.describe "Exercise 1" $
      Hspec.describe "skips" $ do
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
    Hspec.describe "Exercise 2" $
      Hspec.describe "histogram" $ do
        Hspec.it "histogram [1, 1, 1, 5] == ..." $
          Hspec.shouldBe
            (Komatsu.histogram [1, 1, 1, 5])
            " *        \n *        \n *   *    \n==========\n0123456789\n"
        Hspec.it "histogram [1, 4, 5, 4, 6, 6, 3, 4, 2, 4, 9] == ..." $
          Hspec.shouldBe
            (Komatsu.histogram [1, 4, 5, 4, 6, 6, 3, 4, 2, 4, 9])
            "    *     \n    *     \n    * *   \n ******  *\n==========\n0123456789\n"
    Hspec.describe "Exercise 3" $
      Hspec.describe "sieveSundaram" $ do
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
    Hspec.describe "Exercise 4" $
      Hspec.describe "myLast" $ do
        Hspec.it "myLast [] == Nothing" $
          Komatsu.myLast ([] :: [Int]) `Hspec.shouldBe` Nothing
        Hspec.it "myLast [1..5] == Just 5" $
          Komatsu.myLast ([1..5] :: [Int]) `Hspec.shouldBe` Just 5
        HspecQuickCheck.prop "myLast == last" $
          \(QuickCheck.NonEmpty xs) ->
            Komatsu.myLast (xs :: [Int]) == Just (last xs)
    Hspec.describe "Exercise 5" $
      Hspec.describe "myLength" $ do
        Hspec.it "myLength [] == 0" $
          Komatsu.myLength ([] :: [Int]) `Hspec.shouldBe` 0
        Hspec.it "myLength [1..5] == 5" $
          Komatsu.myLength ([1..5] :: [Int]) `Hspec.shouldBe` 5
        HspecQuickCheck.prop "myLength == length" $
          \xs ->
            Komatsu.myLength (xs :: [Int]) == length xs
    Hspec.describe "Exercise 6" $
      Hspec.describe "myReverse" $ do
        Hspec.it "myReverse [] == []" $
          Komatsu.myReverse ([] :: [Int]) `Hspec.shouldBe` []
        Hspec.it "myReverse [1..5] == [5,4..1]" $
          Komatsu.myReverse ([1..5] :: [Int]) `Hspec.shouldBe` [5, 4..1]
        HspecQuickCheck.prop "myReverse == reverse" $
          \xs ->
            Komatsu.myReverse (xs :: [Int]) == reverse xs
    Hspec.describe "Exercise 7" $
      Hspec.describe "compress" $ do
        Hspec.it "compress [] == []" $
          Komatsu.compress "" `Hspec.shouldBe` ""
        Hspec.it "compress \"wwwbwwbbwbbb\" == \"wbwbwb\"" $
          Komatsu.compress "wwwbwwbbwbbb" `Hspec.shouldBe` "wbwbwb"
    Hspec.describe "Exercise 8" $
      Hspec.describe "myGroup" $ do
        Hspec.it "myGroup [] == []" $
          Komatsu.myGroup "" `Hspec.shouldBe` []
        Hspec.it "myGroup \"wwwbwwbbwbbb\" == ..." $
          Hspec.shouldBe
            (Komatsu.myGroup "wwwbwwbbwbbb")
            ["www", "b", "ww", "bb", "w", "bbb"]
        HspecQuickCheck.prop "myGroup == group" $
          \xs ->
            Komatsu.myGroup (xs :: [Int]) == List.group xs
    Hspec.describe "Exercise 9" $
      Hspec.describe "encode" $ do
        Hspec.it "encode [] == []" $
          Komatsu.encode "" `Hspec.shouldBe` []
        Hspec.it "encode \"wwwbwwbbwbbb\" == ..." $
          Hspec.shouldBe
            (Komatsu.encode "wwwbwwbbwbbb")
            [(3, 'w'), (1, 'b'), (2, 'w'), (2, 'b'), (1, 'w'), (3, 'b')]
    Hspec.describe "Exercise 10" $
      Hspec.describe "decode" $ do
        Hspec.it "decode [] == []" $
          Komatsu.decode [] `Hspec.shouldBe` ""
        Hspec.it "decode (encode \"wwwbwwbbwbbb\") == \"wwwbwwbbwbbb\"" $
          Hspec.shouldBe
            (Komatsu.decode (Komatsu.encode "wwwbwwbbwbbb"))
            "wwwbwwbbwbbb"
    Hspec.describe "Exercise 11" $ do
      Hspec.describe "fib" $ do
        Hspec.it "fib 0 == 0" $
          Komatsu.fib 0 `Hspec.shouldBe` 0
        Hspec.it "fib 1 == 1" $
          Komatsu.fib 1 `Hspec.shouldBe` 1
        Hspec.it "fib 2 == 1" $
          Komatsu.fib 2 `Hspec.shouldBe` 1
        Hspec.it "fib 3 == 2" $
          Komatsu.fib 3 `Hspec.shouldBe` 2
        Hspec.it "fib 4 == 3" $
          Komatsu.fib 4 `Hspec.shouldBe` 3
        HspecQuickCheck.prop "n >= 2 ==> fib n == fib (n - 1) + fib (n - 2)" $
          \(QuickCheck.Positive n') ->
            let
              n = mod n' 19
            in
              Komatsu.fib (n + 2) == Komatsu.fib (n + 1) + Komatsu.fib n
      Hspec.describe "fibs1" $ do
        Hspec.it "take 15 fibs1 == ..." $
          Hspec.shouldBe
            (take 15 Komatsu.fibs1)
            [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]
        HspecQuickCheck.prop "take n fibs1 == [fib 0, fib 1, ..., fib (n - 1)]" $
          \(QuickCheck.Positive n') ->
            let
              n = mod n' 19
            in
              take (fromInteger n) Komatsu.fibs1 == fmap Komatsu.fib [0..n - 1]
    Hspec.describe "Exercise 12" $
      Hspec.describe "fibs2" $ do
        Hspec.it "take 15 fibs2 == ..." $
          Hspec.shouldBe
            (take 15 Komatsu.fibs2)
            [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]
        Hspec.it "fib 59 == 956722026041" $
          last (take 60 Komatsu.fibs2) `Hspec.shouldBe` 956722026041
        Hspec.it "fib 119 == 3311648143516982017180081" $
          Hspec.shouldBe
            (last (take 120 Komatsu.fibs2))
            3311648143516982017180081
        HspecQuickCheck.prop "n >= 2 ==> fib n == fib (n - 1) + fib (n - 2)" $
          \(QuickCheck.Positive n) ->
            Komatsu.fibs2 !! (n + 2) == Komatsu.fibs2 !! (n + 1) + Komatsu.fibs2 !! n
    Hspec.describe "Exercise 14" $ do
      Hspec.describe "streamRepeat" $ do
        Hspec.it "streamRepeat True == [True, True, ...]" $
          testStream 5 (Komatsu.streamRepeat True) [True, True, True, True, True]
        HspecQuickCheck.prop "streamRepeat == repeat" $
          \(QuickCheck.Positive n, m :: Int) ->
            testStream n (Komatsu.streamRepeat m) (repeat m)
      Hspec.describe "streamMap" $ do
        HspecQuickCheck.prop "streamMap f (streamRepeat x) == streamRepeat (f x)" $
          \(QuickCheck.Positive n, f :: QuickCheck.Fun Int Int, m) ->
            let
              stream1 = Komatsu.streamMap (QuickCheck.applyFun f) (Komatsu.streamRepeat m)
              stream2 = Komatsu.streamRepeat (QuickCheck.applyFun f m)
            in
              testStream n stream1 (Komatsu.streamToList stream2)
        HspecQuickCheck.prop "streamMap id == id" $
          \(QuickCheck.Positive n, f :: QuickCheck.Fun Int Int, m) ->
            let
              stream = Komatsu.streamFromSeed (QuickCheck.applyFun f) m
            in
              testStream n (Komatsu.streamMap id stream) (Komatsu.streamToList stream)
        HspecQuickCheck.prop "streamMap (g . f) == streamMap g . streamMap f" $
          \(QuickCheck.Positive n, s :: QuickCheck.Fun Int Int, m, f, g :: QuickCheck.Fun Int Int) ->
            let
              stream = Komatsu.streamFromSeed (QuickCheck.applyFun s) m
              stream1 = Komatsu.streamMap (QuickCheck.applyFun g . QuickCheck.applyFun f) stream
              stream2 = Komatsu.streamMap (QuickCheck.applyFun g) (Komatsu.streamMap (QuickCheck.applyFun f) stream)
            in
              testStream n stream1 (Komatsu.streamToList stream2)
      Hspec.describe "streamFromSeed" $ do
        Hspec.it "streamFromSeed not True == [True, False, True, False, ...]" $
          testStream 5 (Komatsu.streamFromSeed not True) [True, False, True, False, True]
        HspecQuickCheck.prop "streamFromSeed f == iterate f" $
          \(QuickCheck.Positive n, f :: QuickCheck.Fun Int Int, m) ->
            testStream n (Komatsu.streamFromSeed (QuickCheck.applyFun f) m) (iterate (QuickCheck.applyFun f) m)
        HspecQuickCheck.prop "streamFromSeed id == streamRepeat" $
          \(QuickCheck.Positive n) ->
            testStream n (Komatsu.streamFromSeed id n) (Komatsu.streamToList (Komatsu.streamRepeat n))
    Hspec.describe "Exercise 15" $ do
      Hspec.describe "nats" $ do
        Hspec.it "take 20 nats == [0, 1, ..., 19]" $
          testStream 20 Komatsu.nats [0..19]
        HspecQuickCheck.prop "nats == [0, 1, ...]" $
          \(QuickCheck.Positive n) ->
            testStream n Komatsu.nats [0..]
      Hspec.describe "ruler" $ do
        Hspec.it "take 10 ruler == [0, 1, 0, 2, 0, 1, 0, 3, 0, 1]" $
          testStream 10 Komatsu.ruler [0, 1, 0, 2, 0, 1, 0, 3, 0, 1]
        Hspec.it "take 20 ruler == [0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2]" $
          testStream 20 Komatsu.ruler [0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2]
    where
      testStream n stream list =
        take n (Komatsu.streamToList stream) `Hspec.shouldBe` take n list
