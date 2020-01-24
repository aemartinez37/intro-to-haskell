----------------------------------------------------------------------
-- |
--
--
--
-- To work on your solution, run:
--
--   stack ghci komatsu:lib komatsu:test:spec
--
----------------------------------------------------------------------

module Komatsu where

-- cis 194 hw 3, ex 1, hopscotch

----------------------------------------------------------------------
-- Exercise 1
----------------------------------------------------------------------

-- |
--
-- >>> skips "ABCD"
-- ["ABCD","BD","C","D"]
-- >>> skips "hello!"
-- ["hello!","el!","l!","l","o","!"]
-- >>> skips [1]
-- [[1]]
-- >>> skips [True, False]
-- [[True,False],[False]]
-- >>> skips []
-- []
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

-- cis 194 h2 3, ex 3, histogram

----------------------------------------------------------------------
-- Exercise 3
----------------------------------------------------------------------

-- |
--
-- >>> putStr (histogram [1,1,1,5])
--  *
--  *
--  *   *
-- ==========
-- 0123456789
-- >>> putStr (histogram [1,4,5,4,6,6,3,4,2,4,9])
--     *
--     *
--     * *
--  ******  *
-- ==========
-- 0123456789

histogram :: [Integer] -> String
histogram = undefined

-- cis 194 h4, ex 4, finding primes

----------------------------------------------------------------------
-- Exercise 4
----------------------------------------------------------------------

-- |
--
-- >>> sieveSundaram 0
-- []
-- >>> sieveSundaram 1
-- [3]
-- >>> sieveSundaram 2
-- [3,5]
-- >>> sieveSundaram 3
-- [3,5,7]
-- >>> sieveSundaram 4
-- [3,5,7]
-- >>> sieveSundaram 5
-- [3,5,7,11]
-- >>> sieveSundaram 10
-- [3,5,7,11,13,17,19]
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

-- | Problem 1, find the lst element of a list.
--
-- >>> myLast [1, 2, 3, 4]
-- 4
--
-- >>> myLast ['x', 'y', 'z']
-- 'z'
--
-- To test your solution, run:
--
--   > :main --match "myLast"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "myLast"'

myLast :: [a] -> a
myLast = undefined

-- | Problem 4, Find the number of elements of a list.
--
-- >>> myLength [123, 456, 789]
-- 3
--
-- >>> myLength "Hello, world!"
-- 13
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

-- | Problem 5, Reverse a list.
--
-- >>> myReverse "A man, a plan, a canal, panama!"
-- "!amanap ,lanac a ,nalp a ,nam A"
--
-- >>> myReverse [1,2,3,4]
--[4,3,2,1]
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

-- | Problem 8, Eliminate consecutive duplicates of list elements.
--
-- If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
--
--
-- >>> compress "aaaabccaadeeee"
-- "abcade"
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

-- | Problem 9, Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.
--
-- >>> pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a',
--             'a', 'd', 'e', 'e', 'e', 'e']
-- ["aaaa","b","cc","aa","d","eeee"]
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

-- | Problem 10, Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
--
-- >>> encode "aaaabccaadeeee"
-- [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
--
-- To test your solution, run:
--
--   > :main --match "encode"
--
-- Or:
--
--   stack build komatsu:test:spec --ta '--match "encode"'

encode :: [a] -> [(Int, a)]
encode = undefined

-- | Problem 12,  Decode a run-length encoded list.
--
-- Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.
--
-- >>> decodeModified
--       [Multiple 4 'a',Single 'b',Multiple 2 'c',
--        Multiple 2 'a',Single 'd',Multiple 4 'e']
-- "aaaabccaadeeee"
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
