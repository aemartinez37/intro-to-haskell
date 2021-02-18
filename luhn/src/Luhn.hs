----------------------------------------------------------------------
-- |
--
-- Luhn
--
-- This is a template to solve CIS 194 (Spring 2013): Homework 1,
-- exercises 1–4 (Validating credit card numbers).
--
-- https://www.cis.upenn.edu/~cis194/spring13/hw/01-intro.pdf
--
-- To work on your solution, run:
--
--   stack ghci luhn:lib luhn:test:spec
--
-- Then, to reload your changes, run:
--
--   > :reload
--
-- Or:
--
--   > :r
--
-- And, to test your solution, run:
--
--   > main
--
----------------------------------------------------------------------

module Luhn where

----------------------------------------------------------------------
-- Exercise 1
----------------------------------------------------------------------

-- |
--
-- >>> toDigits 1234
-- [1,2,3,4]

toDigits :: Integer -> [Integer]
toDigits x = reverse (toDigitsRev x)

toDigitsRev :: Integer -> [Integer]
toDigitsRev x
  | x <= 0      = []
  | otherwise   = b : toDigitsRev a
  where
    (a, b) = divMod x 10

----------------------------------------------------------------------
-- Exercise 2
----------------------------------------------------------------------

-- |
--
-- >>> doubleEveryOther [8, 7, 6, 5]
-- [16,7,12,5]
--
-- >>> doubleEveryOther [1, 2, 3]
-- [1,4,3]

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = reverse [ if (i `mod` 2) /= 0 then x + x else x | (i,x) <- zip [0..] (reverse xs)]

----------------------------------------------------------------------
-- Exercise 3
----------------------------------------------------------------------

-- |
--
-- >>> sumDigits [16, 7, 12, 5]
-- 22

sumDigits :: [Integer] -> Integer
sumDigits xs = sum (map (sum . toDigits) xs)

singleDigitList :: [Integer] -> [Integer]
singleDigitList = concatMap toDigits

sumDigits' :: [Integer] -> Integer
sumDigits' xs = sum (singleDigitList xs)

----------------------------------------------------------------------
-- Exercise 4
----------------------------------------------------------------------

-- |
--
-- >>> validate 4012888888881881
-- True
--
-- >>> validate 4012888888881882
-- False

validate :: Integer -> Bool
validate x = sumDigits (doubleEveryOther (toDigits x)) `mod` 10 == 0
