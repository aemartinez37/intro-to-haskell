{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}
----------------------------------------------------------------------
-- |
--
-- Komatsu
--
-- To work on your solution, run:
--
--   stack ghci komatsu:lib komatsu:test:spec
--
----------------------------------------------------------------------

module Komatsu where

import Data.List (group)

----------------------------------------------------------------------
-- Exercise 1
--
-- CIS 194 (Spring 2013): Homework 3, exercise 1 (Hopscotch)
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/03-rec-poly.pdf
----------------------------------------------------------------------

-- |
--
-- Examples:
--
-- >>> skips "ABCD"
-- ["ABCD","BD","C","D"]
--
-- >>> skips [True, False]
-- [[True,False],[False]]
--
-- To test your solution, run:
--
--   > :main --match "Exercise 1/skips"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 1/skips"'

skips :: [a] -> [[a]]
skips xs =
  let f i _ = [xs !! y | y <- [i,i+i+1..l]]
      l = length xs - 1
  in zipWith f [0..] xs

skips' :: [a] -> [[a]]
skips' xs =
  let f (0, _) = xs
      f (i, _) = [xs !! y | y <- [i,i+i+1..l]]
      l = length xs - 1
  in zipWith (curry f) [0 ..] xs

----------------------------------------------------------------------
-- Exercise 2
--
-- CIS 194 (Spring 2013): Homework 3, exercise 3 (Histogram)
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/03-rec-poly.pdf
----------------------------------------------------------------------

-- |
--
-- Examples:
--
-- >>> putStr (histogram [1,1,1,5])
--  *
--  *
--  *   *
-- ==========
-- 0123456789
--
-- >>> putStr (histogram [1,4,5,4,6,6,3,4,2,4,9])
--     *
--     *
--     * *
--  ******  *
-- ==========
-- 0123456789
--
-- To test your solution, run:
--
--   > :main --match "Exercise 2/histogram"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 2/histogram"'
histogram :: [Integer] -> String
histogram xs = foldl (\acc x -> g x ++ acc) "==========\n0123456789\n" [1..(maximum histoElms)]
  where
    g x = [ if y >= x then '*' else ' ' | y <- histoElms] ++ "\n"
    histoElms = elementsRepetitions xs

-- |
-- `repetitions` => retrieves the times that a number repeat in an array
-- >>> repetitions 3 [1,2,3,4,5,3,7,8]
-- 2
--
-- To test your solution, run:
--
--   > :main --match "Exercise 2/repetitions"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 2/repetitions"'
repetitions :: (Num p, Eq t) => t -> [t] -> p
repetitions _ [] = 0
repetitions n (x:xs)
  | n == x = 1 + repetitions n xs
  | otherwise = repetitions n xs

-- |
-- `elementsRepetitions` => retrieves an array with the
-- total of repetitions for each index (0 - 9) in an array received
-- >>> elementsRepetitions [1,2,3,4,5,3,7,8]
-- [0,1,1,2,1,1,0,1,1,0]
--
-- To test your solution, run:
--
--   > :main --match "Exercise 2/elementsRepetitions"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 2/elementsRepetitions"'
elementsRepetitions :: (Num b, Num a, Enum a, Eq a) => [a] -> [b]
elementsRepetitions xs =
  let f x = (x, repetitions x xs)
      g = map snd 
  in g (map f [0..9])

----------------------------------------------------------------------
-- Exercise 3
--
-- CIS 194 (Spring 2013): Homework 4, exercise 4 (Finding primes)
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/04-higher-order.pdf
----------------------------------------------------------------------

-- |
--
-- Implement the sieve of Sundaram.
--
-- Examples:
--
-- >>> sieveSundaram 1
-- [3]
--
-- >>> sieveSundaram 5
-- [3,5,7,11]
--
-- To test your solution, run:
--
--   > :main --match "Exercise 3/sieveSundaram"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 3/sieveSundaram"'

sieveSundaram :: Integer -> [Integer]
sieveSundaram n = map (\x -> 2*x + 1) (filter (`notElem` excluded) initialList)
  where
    excluded = [x + y + 2 * x * y | x <- initialList, y <- initialList, (x + y + 2 * x * y) <= n]
    initialList = [1..n]

----------------------------------------------------------------------
-- Exercise 4
--
-- H-99: Ninety-nine Haskell problems, problem 1
--
-- https://wiki.haskell.org/99_questions/1_to_10#Problem_1
----------------------------------------------------------------------

-- |
--
-- Extract the last element of a list.
--
-- Examples:
--
-- >>> myLast []
-- Nothing
--
-- >>> myLast [1..5]
-- Just 5
--
-- To test your solution, run:
--
--   > :main --match "Exercise 4/myLast"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 4/myLast"'

myLast :: [a] -> Maybe a
myLast [] = Nothing
myLast xs = (Just . head) $ foldl (flip (:)) [] xs

myLast' :: [a] -> Maybe a
myLast' [] = Nothing
myLast' [x] = Just x
myLast' (_:xs) = myLast xs

----------------------------------------------------------------------
-- Exercise 5
--
-- H-99: Ninety-nine Haskell problems, problem 4
--
-- https://wiki.haskell.org/99_questions/1_to_10#Problem_4
----------------------------------------------------------------------

-- |
--
-- Return the number of elements of a list.
--
-- Example:
--
-- >>> myLength [1..5]
-- 5
--
-- To test your solution, run:
--
--   > :main --match "Exercise 5/myLength"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 5/myLength"'

myLength :: [a] -> Int
myLength = foldr (\_ acc -> (+1) acc) 0

----------------------------------------------------------------------
-- Exercise 6
--
-- H-99: Ninety-nine Haskell problems, problem 5
--
-- https://wiki.haskell.org/99_questions/1_to_10#Problem_5
----------------------------------------------------------------------

-- |
--
-- Return the elements of a list in reverse order.
--
-- Example:
--
-- >>> myReverse [1..5]
--[5,4,3,2,1]
--
-- To test your solution, run:
--
--   > :main --match "Exercise 6/myReverse"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 6/myReverse"'

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

----------------------------------------------------------------------
-- Exercise 7
--
-- H-99: Ninety-nine Haskell problems, problem 8
--
-- https://wiki.haskell.org/99_questions/1_to_10#Problem_8
----------------------------------------------------------------------

-- |
--
-- Remove consecutive duplicates from a list.
--
-- >>> compress "wwwbwwbbwbbb"
-- "wbwbwb"
--
-- To test your solution, run:
--
--   > :main --match "Exercise 7/compress"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 7/compress"'

compress :: (Eq a) => [a] -> [a]
compress xs = fmap head $ myGroup xs

----------------------------------------------------------------------
-- Exercise 8
--
-- H-99: Ninety-nine Haskell problems, problem 9
--
-- https://wiki.haskell.org/99_questions/1_to_10#Problem_9
----------------------------------------------------------------------

-- |
--
-- Group consecutive duplicates from a list.
--
-- Example:
--
-- >>> myGroup "wwwbwwbbwbbb"
-- ["www","b","ww","bb","w","bbb"]
--
-- To test your solution, run:
--
--   > :main --match "Exercise 8/myGroup"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 8/myGroup"'

myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup [x] = [[x]]
myGroup (x:xs) = (fst touple ++ [x]) : myGroup (snd touple)
  where
    touple = span (== x) xs
----------------------------------------------------------------------
-- Exercise 9
--
-- H-99: Ninety-nine Haskell problems, problem 10
--
-- https://wiki.haskell.org/99_questions/1_to_10#Problem_10
----------------------------------------------------------------------

-- |
--
-- Run-length encode a list.
--
-- Example:
--
-- >>> encode "wwwbwwbbwbbb"
-- [(3,'w'),(1,'b'),(2,'w'),(2,'b'),(1,'w'),(3,'b')]
--
-- To test your solution, run:
--
--   > :main --match "Exercise 9/encode"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 9/encode"'

encode :: Eq b => [b] -> [(Int, b)]
encode xs = map (\x -> (length x, head x)) $ group xs

----------------------------------------------------------------------
-- Exercise 10
--
-- H-99: Ninety-nine Haskell problems, problem 12
--
-- https://wiki.haskell.org/99_questions/11_to_20#Problem_12
----------------------------------------------------------------------

-- |
--
-- Decode a run-length encoded list.
--
-- Example:
--
-- >>> decode (encode "wwwbwwbbwbbb")
-- "wwwbwwbbwbbb"
--
-- To test your solution, run:
--
--   > :main --match "Exercise 10/decode"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "Exercise 10/decode"'

decode :: [(Int, a)] -> [a]
decode = concatMap (uncurry replicate)

----------------------------------------------------------------------
-- Exercise 11
--
-- CIS 194 (Spring 2013): Homework 6, exercise 1
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
--
-- To test your solution, run:
--
--   > :main --match "Exercise 11"
----------------------------------------------------------------------

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

fibs1 :: [Integer]
fibs1 = map fib [0..]

----------------------------------------------------------------------
-- Exercise 12
--
-- CIS 194 (Spring 2013): Homework 6, exercise 2
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
--
-- To test your solution, run:
--
--   > :main --match "Exercise 12"
----------------------------------------------------------------------

fibs2 :: [Integer]
fibs2 = 0 : 1 : zipWith (+) fibs2 (tail fibs2)

----------------------------------------------------------------------
-- Exercise 13
--
-- CIS 194 (Spring 2013): Homework 6, exercise 3
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
----------------------------------------------------------------------

data Stream a = Cons a (Stream a)

instance Show a => Show (Stream a) where
  show = show . take 20 . streamToList

streamToList :: Stream a -> [a]
streamToList (Cons x y) = x : streamToList y

----------------------------------------------------------------------
-- Exercise 14
--
-- CIS 194 (Spring 2013): Homework 6, exercise 4
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
--
-- To test your solution, run:
--
--   > :main --match "Exercise 14"
----------------------------------------------------------------------

streamRepeat :: a -> Stream a
streamRepeat x = Cons x (streamRepeat x)

streamMap :: (a -> b) -> Stream a -> Stream b
streamMap f (Cons x xs) = Cons (f x) (streamMap f xs)

streamFromSeed :: (a -> a) -> a -> Stream a
streamFromSeed f x = Cons x (streamFromSeed f (f x))

----------------------------------------------------------------------
-- Exercise 15
--
-- CIS 194 (Spring 2013): Homework 6, exercise 5
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
--
-- To test your solution, run:
--
--   > :main --match "Exercise 15"
----------------------------------------------------------------------

nats :: Stream Integer
nats = streamFromSeed (+1) 0

----------

interleaveStreams :: Stream a -> Stream a -> Stream a
interleaveStreams (Cons x xs) ys = Cons x (interleaveStreams ys xs)

ruler :: Stream Integer
ruler = ruler' 0
  where ruler' x = interleaveStreams (streamRepeat x) (ruler' (x+1))

----------------------------------------------------------------------
-- Exercise 16 (Optional)
--
-- CIS 194 (Spring 2013): Homework 6, exercise 6
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
----------------------------------------------------------------------

x :: Stream Integer
x = Cons 0 (Cons 1 (streamRepeat 0))

instance Num (Stream Integer) where
    fromInteger n = Cons n (streamRepeat 0)
    negate (Cons y ys) = Cons (-y) (negate ys)
    (+) (Cons a as) (Cons b bs) = Cons (a+b) (as + bs)
    (*) (Cons a as) b'@(Cons b bs) = Cons (a*b) (streamMap (*a) bs + (as*b'))

instance Fractional (Stream Integer) where
    (/) (Cons a as) (Cons b bs) = q
        where q = Cons (a `div` b) (streamMap (`div` b) (as - q * bs))

fibs3 :: Stream Integer
fibs3 = x / (1 - x - x * x)

----------------------------------------------------------------------
-- Exercise 17 (Optional)
--
-- CIS 194 (Spring 2013): Homework 6, exercise 7
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
----------------------------------------------------------------------

data Matrix = Matrix Integer Integer Integer Integer deriving Show

instance Num Matrix where
  (*) (Matrix x11 x12 x21 x22) (Matrix y11 y12 y21 y22) =
      (Matrix (x11*y11+x12*y21) (x11*y12+x12*y22)
              (x21*y11+x22*y21) (x21*y12+x22*y22))

fibs4 :: Integer -> Integer
fibs4 0 = 0
fibs4 1 = 1
fibs4 n = g ( f ^ (n-1) )
  where f = Matrix 1 1 1 0
        g (Matrix x11 _ _ _) = x11