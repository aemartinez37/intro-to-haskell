----------------------------------------------------------------------
-- |
--
-- Experiments
--
-- To work on your experiments, run:
--
--   stack ghci experiments:lib experiments:test:spec
--
----------------------------------------------------------------------

module Experiments where

-- CHAPTER 1
----------------------------------------------------------------------
-- Chapter 1 - Introduction, 1.7 Exercises
-- Exercise 1
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221

-- Give another possible calculation for the result of double (double 2)
-- double x = x + x
----------------------------------------------------------------------
--   double (double 2)
-- =    {applying the outer double}
--   double 2 + double 2
-- =    {applying the first double}
--   (2 + 2) + double 2
-- =    {applying double}
--   (2 + 2) + (2 + 2)
-- =    {applying the first +}
--   4 + (2 + 2)
-- =    {applying the second +}
--   4 + 4
-- =    {applying +}
--   8
----------------------------------------------------------------------





----------------------------------------------------------------------
-- Chapter 1 - Introduction, 1.7 Exercises
-- Exercise 2
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
--
-- Show that sum [x] = x for any number x.
-- sum []     = 0               (1)
-- sum (n:ns) = n + sum ns      (2)
----------------------------------------------------------------------
--   sum [x]
-- =    {applying (2)}
--   x + sum []
-- =    {applying (1)}
--   x + 0
-- =    {applying +}
--   x
----------------------------------------------------------------------





----------------------------------------------------------------------
-- Chapter 1 - Introduction, 1.7 Exercises
-- Exercise 3
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
-- 
-- Define a function product that produces the product of a list of numbers,
-- and show using your definition that product [2,3,4] = 24
----------------------------------------------------------------------
product' :: Num a => [a] -> a
product' = foldr (*) 1
----------------------------------------------------------------------
--   product' [2,3,4]
-- =    {applying (2)}
--   2 * product' [3,4]
-- =    {applying (2)}
--   2 * 3 * product' [4]
-- =    {applying (2)}
--   2 * 3 * 4 * product' []
-- =    {applying (1)}
--   2 * 3 * 4 * 1
-- =    {applying first *}
--   6 * 4 * 1
-- =    {applying first *}
--   24 * 1
-- =    {applying *}
--   24
----------------------------------------------------------------------





----------------------------------------------------------------------
-- Chapter 1 - Introduction, 1.7 Exercises
-- Exercise 4
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
--
-- How should the definition of function qsort be modified so that it produces
-- a reverse sorted version of a list?
----------------------------------------------------------------------
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
               where
                   smaller = [a | a <- xs, a <= x]
                   larger  = [b | b <- xs, b > x]
----------------------------------------------------------------------





----------------------------------------------------------------------
-- Chapter 1 - Introduction, 1.7 Exercises
-- Exercise 5
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
--
-- What would be the effect of replacing <= by < in the original definition of
-- qsort? Hint: consider the example qsort [2,2,3,1,1].
----------------------------------------------------------------------
qsort' :: Ord a => [a] -> [a]
qsort' [] = []
qsort' (x:xs) = qsort' smaller ++ [x] ++ qsort' larger
               where
                   smaller = [a | a <- xs, a < x]
                   larger  = [b | b <- xs, b > x]
----------------------------------------------------------------------
-- Repeated elements of input array will not be part of the output array.
----------------------------------------------------------------------





-- CHAPTER 2
----------------------------------------------------------------------
-- Chapter 2 - First steps, 2.7 Exercises
-- Exercise 2
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
--
-- Parenthesise the following expressions:
-- 2^3*4
-- 2*3+4*5
-- 2+3*4^5
----------------------------------------------------------------------
-- (2 ^ 3) * 4
-- (2 * 3) + (4 * 5)
-- 2 + (3 * (4 ^ 5))
----------------------------------------------------------------------





----------------------------------------------------------------------
-- Chapter 2 - First steps, 2.7 Exercises
-- Exercise 3
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
--
-- The script below contents three syntactic errors. Correct these errors
-- and then check that your script works properly using GHCi.
--
-- N = a ´div´ length xs
--     where
--         a = 10
--         xs = [1,2,3,4,5]    
----------------------------------------------------------------------
n :: Int
n = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]
----------------------------------------------------------------------





----------------------------------------------------------------------
-- Chapter 2 - First steps, 2.7 Exercises
-- Exercise 4
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
--
-- The library function last selects the last element of a non-empty list;
-- for example, last [1,2,3,4,5] = 5. Show how the function last could de defined
-- in terms of other library functions introduced in this chapter. Can you
-- think of another possible definition?
----------------------------------------------------------------------
last' :: [a] -> a
last' [] = error "Not last element of empty list!"
last' xs = head (reverse xs)

----------------------------------------------------------------------





----------------------------------------------------------------------
-- Chapter 2 - First steps, 2.7 Exercises
-- Exercise 5
--
-- Programming in Haskell (Graham Hutton 2016)
--
-- https://www.book2look.com/vbook.aspx?id=9781316626221
--
-- The library function init removes the last element from non-empty list;
-- for example, init [1,2,3,4,5] = [1,2,3,4]. Show how init could similary
-- be defined in two different ways.
----------------------------------------------------------------------
--1)
init' :: [a] -> [a]
init' [] = error "No init for empty list!"
init' xs = reverse (drop 1 (reverse xs))

-- 2)
init'' :: [a] -> [a]
init'' [] = error "No init for empty list!"
init'' xs = reverse (tail (reverse xs))
----------------------------------------------------------------------