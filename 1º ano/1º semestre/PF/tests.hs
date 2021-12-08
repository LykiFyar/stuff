module Testes where

import System.Random
import Data.Char

{-
type Mat a = [[a]]


mat1 = [[6,7,2],[1,5,8],[8,3,4]]


getElem :: Mat a -> IO a
getElem m = do l <- randomRIO (0,(length m)-1)
               c <- randomRIO (0,(length (head m))-1)
               return (select l c m)


select :: Int -> Int -> Mat a -> a
select l c m = (m !! l) !! c

type RelP a = [(a,a)]
type RelL a = [(a,[a])]
type RelF a = ([a], a->[a])


convLP :: RelL a -> RelP a
convLP l = concat (map junta l)
     where junta (x,xs) = map (\y -> (x,y)) xs

convPL ::(Eq a) => RelP a -> RelL a
convPL [] = []
convPL ((x,y):xs) = let (lx,tx) = filtra x xs
                    in (x,y:lx):convPL tx

filtra :: (Eq a) => a -> RelP a -> ([a], RelP a)
filtra _ [] = ([],[])
filtra n (a@(x,y):t) = let (lx,tx) = filtra x t
                       in if n == x 
                          then (y:lx, t)
                          else (lx,a:tx)
criaRelPint :: Int -> IO (RelP Int)
criaRelPint 0 = return []
criaRelPint n = do putStr "Insira um par da relação do tipo (x,y): "
                   x <- getLine
                   s <- criaRelPint (n-1)
                   return ((read x):s) 

rf1 = ([1,2,3,4,5],f)
  where f 1 = [2,3]
        f 2 = [4]
        f 3 = [3,5]
        f 4 = [3,4]
        f 5 = [4,5]


convFP :: (Eq a) => RelF a -> RelP a
convFP ([],_) = []
convFP (l,g) = undefined

-- convPF :: (Eq a) => RelP a -> RelF a
-- convPF l = (nub((map fst l) ++ (map snd l)) , ..)


type BTree a = Empty 
             | Node a (Btree a) (Btree a)
  deriving Show

lookupAP :: Ord a => a -> Btree (a,b) -> Maybe b
lookupAP x Empty = Nothing
lookupAP x (Node (y,z) e d)
           | x == y = Just z
           | x < y = lookupAP x e
           | x > y = lookupAP x d

zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c
zipWithBT f (Node x e d) (Node y e1 d1) = Node (f x y) (zipWithBT f e e1) (zipWithBT f d d1)
zipWithBT _ _ _ = Empty

-}
------------------------------------------ Teste 18/19
-- 1
-- a
elemIndices :: Eq a => a -> [a] -> [Int] 
elemIndices x s = aux x 0 s
    where aux _ _ [] = []
          aux x ac (y:s) | x==y = [ac] ++ aux x (ac+1) s
                         | otherwise = aux x (ac+1) s

-- b
isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf [] [] = True
isSubsequenceOf _ [] = False
isSubsequenceOf [] _ = True
isSubsequenceOf (x:s) (y:t) | x==y = isSubsequenceOf s t
                            | otherwise = isSubsequenceOf (x:s) t


-- 2
data BTree a = Empty | Node a (BTree a) (BTree a)

-- a
lookupAP :: Ord a => a -> BTree (a,b) -> Maybe b
lookupAP _ Empty = Nothing
lookupAP a (Node (x,y) e d) | a==x = Just y
                            | a<x = lookupAP a e
                            | otherwise = lookupAP a d

-- b
zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c
zipWithBT f (Node a1 e1 d1) (Node a2 e2 d2) = Node (f a1 a2) (zipWithBT f e1 e2) (zipWithBT f d1 d2)
zipWithBT _ _ _ = Empty


-- 3
digitAlpha :: String -> (String,String)
digitAlpha s = foldr (\x (a,b)-> if isDigit x then (x:a,b) else if isAlpha x then (a,x:b) else (a,b)) ([],[]) s

-- 4
data Seq a = Nil | Cons a (Seq a) | App (Seq a) (Seq a)

-- a
firstSeq :: Seq a -> a
firstSeq (App Nil s) = firstSeq s
firstSeq (Cons a _) = a
firstSeq (App x y) = firstSeq x

-- b
{-}
dropSeq :: Int -> Seq a -> Seq a
dropSeq 0 x = x
dropSeq n (Const _ s) = dropSeq (n-1) s
dropSeq n (App Nil s) =
dropSeq n (App x s) = App (dropSeq n x) s
-}

-- c
instance Show a => Show (Seq a) where
 show x = "<<" ++ mostra x ++ ">>"

mostra :: Show a => Seq a -> String
mostra Nil = ""
mostra (Cons x Nil) = show x
mostra (Cons x b) = show x ++ "," ++ mostra b
mostra (App a b) = mostra a ++ "," ++ mostra b

-- 5
type Mat a = [[a]]

-- a
getElem :: Mat a -> IO a
getElem s = do l <- randomRIO (0,(length s)-1)
               c <- randomRIO (0,(length (head s))-1)
               let x = s !! l !! c
               return x

-- b
{-magic :: Mat Int -> Bool 
magic = undefined


linhasIguais :: Mat Int -> Bool
linhasIguais a = 
-}

---------------------------------------------Teste 17/18
-- 1
insert :: Ord a => a -> [a] -> [a]
insert a (x:xs) | a > x = x:insert a xs
                | otherwise = a:x:xs


-- 2
catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes ((Just a):t) = a:catMaybes t
catMaybes (Nothing:t) = catMaybes t

-- 3
data Exp a = Const a
           | Var String
           | Mais (Exp a) (Exp a)
           | Mult (Exp a) (Exp a)

instance Show a => Show (Exp a) where
  show (Const a) = show a
  show (Var x) = x
  show (Mais e d) = "(" ++ show e ++ " + " ++ show d ++ ")"
  show (Mult e d) = "(" ++ show e ++ " * " ++ show d ++ ")"

-- 4
sortOn :: Ord b => (a -> b) -> [a] -> [a]
sortOn _ [] = [] 
sortOn f (x:s) = insertF x (sortOn f s)
     where insertF x [] = [x]
           insertF x (y:s) | f x > f y = y:insertF x s
                             | otherwise = x:y:s

-- 5
{-}
amplitude :: [Int] -> Int
amplitude x = b-a
    where (a,b) = foldr (\(n,s) x-> if n<s then (n,s) else if n>s then (s,n) else (n,s)) 0 x

-}
-- 6
data Imagem = Quadrado Int
            | Mover (Int,Int) Imagem
            | Juntar [Imagem]
 
ex :: Imagem
ex = Mover (5,5) (Juntar [Mover (0,1) (Quadrado 5),
                          Quadrado 4,
                          Mover (4,3) (Quadrado 2)])

-- a
conta :: Imagem -> Int
conta (Quadrado _) = 1
conta (Mover _ a) = conta a
conta (Juntar a) = sum (map conta a)

-- b
apaga :: Imagem -> IO Imagem
apaga a = do let 



ordem



