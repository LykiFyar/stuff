module CinquentaQuestoes where

-- NÍVEL DE DIFICULDADE (na minha opinião) vai de * a *****

import Data.Char


-- 1
enumFromTo1 :: Int -> Int -> [Int]
enumFromTo1 x y | x==y = [x]
enumFromTo1 x y = (x:enumFromTo1 (x+1) y)

-- 2 (*)
enumFromThenTo1 :: Int -> Int -> Int -> [Int] 
enumFromThenTo1 x y z | (z-x)<(y-1) = [x]
                      | otherwise = (x:enumFromThenTo1 (x+y-1) y z)

-- 3
(+++) :: [a] -> [a] -> [a]
(+++) [] (y:ys) = (y:(+++) [] ys)
(+++) (x:xs) (y:ys) = (x:(+++) xs (y:ys))
(+++) _ _ = []

-- 4 
(!!!) :: [a] -> Int -> a
(!!!) (x:xs) y | y==0 = x
               | otherwise = (!!!) xs (y-1)

-- 5
reverse1 :: [a] -> [a]
reverse1 [] = []
reverse1 (x:xs) = reverse1 xs ++ [x]

-- 6
take1 :: Int -> [a] -> [a]
take1 _ [] = []
take1 0 _ = []
take1 n (x:xs) = (x:take1 (n-1) xs)

-- 7
drop1 :: Int -> [a] -> [a]
drop1 0 (x:xs) = (x:xs)
drop1 _ [] = []
drop1 n (x:xs) = drop1 (n-1) xs

-- 8
zip1 :: [a] -> [b] -> [(a,b)]
zip1 [] _ = []
zip1 _ [] = []
zip1 (x:xs) (y:ys) =((x,y):zip1 xs ys)

-- 9
elem1 :: Eq a => a -> [a] -> Bool 
elem1 _ [] = False
elem1 x (y:ys) | x==y = True
               | otherwise = elem1 x ys

-- 10
replicate1 :: Int -> a -> [a] 
replicate1 0 _ = []
replicate1 n x = (x:replicate1 (n-1) x)

-- 11
intersperse1 :: a -> [a] -> [a]
intersperse1 _ [t] = [t]
intersperse1 x (t:s) = (t:x:intersperse1 x s)

-- 12 VÊ SE PERCEBES ESTA Q É FUDIDA (****)
group' :: Eq a => [a] -> [[a]]
group' [] = []
group' (x:xs) = (x:aux xs):aux2 xs
    where
        aux [] = []
        aux (y:ys) = if x == y then (y : aux ys) else []
        aux2 [] = []
        aux2 (z:zs) = if z == x then aux2 zs else group' (z:zs)

-- 13
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs)= x ++ concat' xs

-- 14 (***)
inits :: [a] -> [[a]]
inits [] = [[]]
inits l = inits (init l) ++ [l]

-- 15
tails :: [a] -> [[a]]
tails [] = [[]]
tails (x:xs) = ((x:xs):tails xs)

-- 16  (**)
isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf _ [] = False
isPrefixOf [] _ = True
isPrefixOf (x:xs) (y:ys) = x==y && isPrefixOf xs ys 

-- 17  (**)
isSuffixOf :: Eq a => [a] -> [a] -> Bool
isSuffixOf [] _ = True
isSuffixOf _ [] = False
isSuffixOf (x:xs) (y:ys) = x==y || isSuffixOf xs ys
 
-- 18
isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf _ [] = False
isSubsequenceOf [] _ = True
isSubsequenceOf (x:xs) (y:ys) = if x==y then (isSubsequenceOf xs ys) else (isSubsequenceOf (x:xs) ys)

-- 19 (****)
elemIndices :: Eq a => a -> [a] -> [Int] 
elemIndices x l = aux x l 0
   where aux _ [] ac = []
         aux x (y:t) ac | x==y = ac:aux x t (ac+1)
                        | otherwise = aux x t (ac+1)

-- 20
nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:s) = x:nub (aux x s)
    where aux _ [] = []
          aux x (y:t) | x==y = aux x t
                      | otherwise = y:aux x t
 

-- 21
delete :: Eq a => a -> [a] -> [a] 
delete _ [] = []
delete a (x:xs) | a==x = xs
                | otherwise = x:delete a xs

-- 22
(\\) :: Eq a => [a] -> [a] -> [a]
(\\) [] _ = []
(\\) x [] = x
(\\) (x:xs) (y:ys) | x==y =(\\) xs ys
                   | otherwise = x:(\\) xs (y:ys)

-- 23 (***)
union :: Eq a => [a] -> [a] -> [a]
union [] x = x
union x [] = x
union l (y:ys) | elem y l = union l ys
               | otherwise = union (l++[y]) ys

-- 24
intersect :: Eq a => [a] -> [a] -> [a]
intersect [] _ = []
intersect _ [] =  []
intersect (x:xs) l | elem x l = x:intersect xs l
                   | otherwise = intersect xs l

-- 25
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:s) | y<x = y:insert x s
               | otherwise = x:y:s

-- 26
unwords' :: [String] -> String
unwords' [] = ""
unwords' [x] = x
unwords' (x:xs) = x ++ " " ++ unwords xs

-- 27
unlines' :: [String] -> String
unlines' [] = ""
unlines' [x] = x ++ "\n"
unlines' (x:xs) = x ++ "\n" ++ unlines' xs

-- 28
pMaior :: Ord a => [a] -> Int
pMaior [] = 0
pMaior (x:xs) | maximum (x:xs) == x = 0
              | otherwise = 1+pMaior xs

-- 29
temRepetidos :: Eq a => [a] -> Bool
temRepetidos [] = False
temRepetidos (x:xs) = elem x xs || temRepetidos xs

-- 30
algarismos :: [Char] -> [Char]
algarismos [] = ""
algarismos (x:xs) | ord x >= 48 && ord x <= 57 = x:algarismos xs
                  | otherwise = algarismos xs

-- 31
posImpares :: [a] -> [a]
posImpares [] = []
posImpares l = aux l 0
     where aux [] _ = []
           aux (x:xs) y | odd y = x:aux xs (y+1)
                        | otherwise = aux xs (y+1)
 
-- 32
posPares :: [a] -> [a]
posPares [] = []
posPares l = aux l 0
     where aux [] _ = []
           aux (x:xs) y | even y = x:aux xs (y+1)
                        | otherwise = aux xs (y+1)

-- 33
isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted [x] = True
isSorted (x:y:xs) | x<=y = isSorted (y:xs)
                  | otherwise = False

isSorted' :: Ord a => [a] -> Bool
isSorted' [x] = True
isSorted' (x:y:s) = x<=y && isSorted' (y:s)

-- 34
iSort :: Ord a => [a] -> [a]
iSort [] = []
iSort (x:xs) = insert x (iSort xs)

-- 35 ????????
menor :: String -> String -> Bool
menor x y = x<y 

-- 36
elemMSet :: Eq a => a -> [(a,Int)] -> Bool
elemMSet _ [] = False
elemMSet x ((y,z):t) | x==y = True
                     | otherwise = elemMSet x t
-- 37 
lengthMSet :: [(a,Int)] -> Int 
lengthMSet [] = 0
lengthMSet ((_,y):t) = y + lengthMSet t


-- 38 
converteMSet :: [(a,Int)] -> [a] 
converteMSet [] = []
converteMSet ((x,y):t) | y>0 = [x]++converteMSet ((x,y-1):t)
                       | otherwise = converteMSet t

-- 39
insereMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
insereMSet n [] =  [(n,1)]
insereMSet n ((x,y):t) | n==x = ((x,y+1):insereMSet n t)
                       | otherwise = (x,y):insereMSet n t

-- 40 
removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet n [] = []
removeMSet n ((x,y):t) | n==x && y==1 = removeMSet n t
                       | n==x && y>1 = ((x,y-1):removeMSet n t)
                       | otherwise = (x,y):removeMSet n t

-- 41  (***)
constroiMSet :: Ord a => [a] -> [(a,Int)]
constroiMSet l = aux l 1
    where aux [i] x = [(i,x)]
          aux (x:y:s) ac | x==y = aux (y:s) (ac+1)
                         | otherwise = (x,ac):aux (y:s) 1

-- 42
partitionEithers :: [Either a b] -> ([a],[b])
partitionEithers [] = ([],[])
partitionEithers l = (left l, right l)
          where left [] = []
                left (Left x:t) = (x:left t)
                left (Right x : t) = left t
                right [] = []
                right (Left x :t) = right t
                right (Right x :t) = x:right t 

-- 43
catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (x:xs) = case x of Just a -> a:catMaybes xs
                             Nothing -> catMaybes xs

-- 44
data Movimento = Norte | Sul | Este | Oeste 
                 deriving Show

posicao :: (Int,Int) -> [Movimento] -> (Int,Int) 
posicao x [] = x
posicao (x,y) (m:t) = posicao a t
               where a = case m of Norte -> (x,y+1)
                                   Sul -> (x,y-1)
                                   Este -> (x+1,y)
                                   Oeste -> (x-1,y)

-- 45
caminho :: (Int,Int) -> (Int,Int) -> [Movimento]
caminho (x,y) (s,t) | x<s = [Este] ++ caminho (x+1,y) (s,t)
                    | x>s = [Oeste] ++ caminho (x-1,y) (s,t)
                    | y<t = [Norte] ++ caminho (x,y+1) (s,t)
                    | y>t = [Sul] ++ caminho (x,y-1) (s,t)
caminho _ _ = []

-- 46
vertical :: [Movimento] -> Bool
vertical [] = True
vertical (Este:_) = False
vertical (Oeste:_) = False
vertical (_:s) = vertical s

-- 47
data Posicao = Pos Int Int
 deriving Show

maisCentral :: [Posicao] -> Posicao
maisCentral [a] = a
maisCentral (Pos x y:Pos a b:s) | l<t = maisCentral (Pos x y:s)
                            | otherwise = maisCentral (Pos a b:s)
                                  where l=(x^2 + y^2)
                                        t=(a^2 + b^2)

-- 48
vizinhos :: Posicao -> [Posicao] -> [Posicao]
vizinhos _ [] = []
vizinhos (Pos x y) ((Pos a b):s) | (x-1==a || x+1==a) && (y-1==b || y+1==b) = (Pos a b):vizinhos (Pos x y) s
                                 | otherwise = vizinhos (Pos x y) s
-- corrigir ^^^^^^^^
-- 49
mesmaOrdenada :: [Posicao] -> Bool
mesmaOrdenada [Pos x y] = True
mesmaOrdenada (Pos x y:Pos a b:s) | y==b = mesmaOrdenada (Pos a b:s)
                                  | otherwise = False

-- 50
data Semaforo = Verde | Amarelo | Vermelho
 deriving Show
{-}
interseccaoOK :: [Semaforo] -> Bool
interseccaoOK l = aux l < ...
       where aux (x:xs) 

CAGUEIIIIIIIIIIIIII -} 
