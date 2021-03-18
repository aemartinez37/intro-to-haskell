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
