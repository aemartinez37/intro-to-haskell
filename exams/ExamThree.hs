module ExamThree where

--1.
join' :: Monad m => m (m a) -> m a
join' mmx = do  
    m <- mmx
    id m 

--2.
(>>>==) :: Monad m => m a -> (a -> m b) -> m b
mx >>>== k = join' (fmap k mx)

--3.
mapA :: Applicative f => (a -> f b) -> [a] -> f [b]
mapA _ [] = pure []
mapA f (x:xs) = (:) <$> f x <*> mapA f xs

--4.
sequenceA' :: Applicative f => [f a] -> f [a]
sequenceA' = mapA id

--5.
replicate' :: Int -> a -> [a]
replicate' n x = take n (repeat x)

replicateA' n fx = sequenceA' (replicate' n fx)
