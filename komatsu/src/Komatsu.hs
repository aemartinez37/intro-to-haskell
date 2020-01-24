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
--   > :main --match "skips"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "skips"'

skips :: [a] -> [[a]]
skips = undefined

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

histogram :: [Integer] -> String
histogram = undefined

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
--   > :main --match "sieveSundaram"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "sieveSundaram"'

sieveSundaram :: Integer -> [Integer]
sieveSundaram = undefined

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
--   > :main --match "myLast"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "myLast"'

myLast :: [a] -> Maybe a
myLast = undefined

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
--   > :main --match "myLength"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "myLength"'

myLength :: [a] -> Int
myLength = undefined

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
--   > :main --match "myReverse"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "myReverse"'

myReverse :: [a] -> [a]
myReverse = undefined

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
--   > :main --match "compress"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "compress"'

compress :: [a] -> [a]
compress = undefined

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
--   > :main --match "myGroup"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "myGroup"'

myGroup :: [a] -> [[a]]
myGroup = undefined

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
--   > :main --match "encode:"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "encode:"'

encode :: [a] -> [(Int, a)]
encode = undefined

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
--   > :main --match "decode"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "decode"'

decode :: [(Int, a)] -> [a]
decode = undefined
