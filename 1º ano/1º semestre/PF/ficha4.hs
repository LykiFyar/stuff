module Ficha4 where


import Data.Char

-- 1
-- a
-- x<-[6,12,18] , 

-- b
-- 












-- 2
-- a
-- [2^x | x <- [0..10]]
-- b
-- [(x,y) | x <- [1..5], y <- [6-x]] / [(x,y) | x <- [1..5], y <- [1..5], x + y == 6]
-- c
-- [take x [1..5] | x <- [1..5]] / [ [1..x] | x <- [1..5]]
-- d
-- [take x [1,1..] | x <- [1..5]] / [ replicate x 1 | x <- [1..5]]
-- e
-- [ product [1..x] | x<- [1..6]]

-- 3
digitAlpha :: String -> (String,String)
digitAlpha [] = ([],[])
digitAlpha (x:xs) | isDigit x = (x:a,b)
                  | isAlpha x = (a,x:b)
                  | otherwise = (a,b)
                  where (a,b) = digitAlpha xs

-- 4 
nzp :: [Int] -> (Int,Int,Int)
nzp [] = (0,0,0)
nzp (x:xs) | x<0 = (1+a,b,c)
           | x==0 = (a,1+b,c)
           | x>0 = (a,b,1+c)
         where (a,b,c) = nzp xs

-- 5
divMod' :: Integral a => a -> a -> (a, a)
divMod' x y | x>=y = (1+a,b)
            | otherwise = (0,x)
          where (a,b) = divMod' (x-y) y 

-- 6
fromDigits :: [Int] -> Int
fromDigits [] = 0
fromDigits l = fdaux l 0
          where fdaux [] ac = ac
                fdaux (x:xs) ac = fdaux xs (x*10^(length xs) + ac)
-- 7

maxSumInit' :: (Num a, Ord a) => [a] -> a
maxSumInit' l = aux l 0 0
            where aux [] m s = m
                  aux (x:xs) m s | m< s+x = aux xs (s+x) (s+x)
                                 | otherwise = aux xs m (s+x) 

-- 8
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fibaux n (0,1)
      where fibaux 0 (a,b) = a
            fibaux 1 (a,b) = b
            fibaux n (a,b) | n>1 = fibaux (n-1) (b,a+b)            






