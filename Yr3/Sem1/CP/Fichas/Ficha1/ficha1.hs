module Ficha1 where

-- FICHA 1
-- EX3
mylength :: [a] -> Integer
mylength [] = 0
mylength (x:xs) = 1 + mylength xs


myreverse :: [a] -> [a]
myreverse [] = []
myreverse (x:xs) = (myreverse xs) ++ [x]

-- EX4 ????????????????????????
myfilter :: (a -> Bool) -> [a] -> [a]
myfilter a [] = []
myfilter a (x:xs) | x a = (x : myfilter a xs) 
                  | otherwise = myfilter a xs

-- EX5
