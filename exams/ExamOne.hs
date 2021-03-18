module ExamOne where

import Data.Monoid

--1.

filter' :: Foldable t => (a -> Bool) -> t a -> [a]
filter' f xs = foldr (\y ys -> if f y then y:ys else ys) [] xs


--2.
--(a)
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc [] = acc
foldl' f acc (x:xs) = foldl f (f acc x) xs

--(b)
-- foldr (\x y -> concat ["(",x,"+",y,")"]) "0" (map show [1..5])
-- "(1+(2+(3+(4+(5+0)))))"

-- foldl (\x y -> concat ["(",x,"+",y,")"]) "0" (map show [1..5])
-- "(((((0+1)+2)+3)+4)+5)"


--3.

instance Monoid a => Monoid (Maybe a) where
 mempty :: maybe a
 mempty = Nothing

 mappend :: Maybe a -> Maybe a -> Maybe a
 mappend x Nothing = x
 mappend Nothing x = x