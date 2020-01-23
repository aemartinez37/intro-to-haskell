----------------------------------------------------------------------
-- |
--
-- The Luhn algorithm
--
-- This is a template to solve CIS 194 (Spring 2013): Homework 1,
-- exercises 1–4 (validating credit card numbers).
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
toDigits = undefined

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
doubleEveryOther = undefined

----------------------------------------------------------------------
-- Exercise 3
----------------------------------------------------------------------

-- |
--
-- >>> sumDigits [16, 7, 12, 5]
-- 22

sumDigits :: [Integer] -> Integer
sumDigits = undefined

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
validate = undefined
