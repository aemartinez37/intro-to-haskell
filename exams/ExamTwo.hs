module ExamTwo where

--1.

liftA' :: Applicative f => (a -> b) -> f a -> f b
liftA' f mx = pure f <*> mx

--2.

-- Aplicative functors allow to operate on several functors with a single function.

-- Aplicative functors are more powerfull than a functor because allow to take a
-- function that expects parameters that aren't necessarily wrapped in functors and
-- use that function to operate on several values that are in functor contexts.

-- Functor:
-- Prelude> fmap (+2) (Just 3)
-- Just 5

-- Aplicative functor:
-- Prelude> pure (+) <*> Just 2 <*> Just 3
-- Just 5


--3.

-- (a). 2
-- (b). 3
-- (c). 2
-- (d). 2

--4.

-- Alternative allows to choose between two aplicative functors (left, right; left preference).

-- One usefull example of alternative is parallel parsing, example:

-- digit :: Int -> String -> Maybe Int
-- digit _ []                     = Nothing
-- digit i (c:_) | i > 9 || i < 0 = Nothing
--               | otherwise      =
--   if [c] == show i then Just i else Nothing

-- binChar :: String -> Maybe Int
-- binChar s = digit 0 s <|> digit 1 s

-- Ref: https://en.wikibooks.org/wiki/Haskell/Alternative_and_MonadPlus