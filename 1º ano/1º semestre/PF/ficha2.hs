module Ficha2 where


import Data.Char


-- 1

-- a
funA :: [Double]-> Double
funA [] = 0
funA (y:ys) = y^2 + (funA ys)
-- b
funB :: [Int] -> [Int]
funB [] = []
funB (h:t) = if (mod h 2)==0 then h : (funB t)
                             else (funB t)
-- c 
funC (x:y:t) = funC t
funC [x] = []
funC [] = []
-- d
funD l = g [] l
g l [] = l
g l (h:t) = g (h:l) t
-- 2
-- a
dobros :: [Float] -> [Float]
dobros [] = []
dobros (x:xs) = (x*2: (dobros xs))
-- b
numOcorre :: Char -> String -> Int
numOcorre c [] = 0
numOcorre x (y:ys) = if x==y
                     then 1+numOcorre x (ys)
                     else numOcorre x (ys)
-- c
positivos :: [Int] -> Bool
positivos [] = True
positivos (x:xs) = if x > 0 then positivos xs
                            else False
-- d
soPos :: [Int] -> [Int]
soPos [] = []
soPos (x:xs) 
               | x>0 = (x : soPos xs)
               | otherwise = soPos xs
-- e
somaNeg :: [Int] -> Int
somaNeg [] = 0
somaNeg (x:xs) | x<0 = x + somaNeg xs
               | otherwise = somaNeg xs
--f
tresUlt :: [a] -> [a]
tresUlt [] = []
tresUlt [x] = [x]
tresUlt [x,y] = [x,y]
tresUlt [x,y,z] = [x,y,z]
tresUlt (h:t) = tresUlt t

--g
segundos :: [(a,b)] -> [b]
segundos [] = []
segundos ((a,b):t) = (b:segundos t)
-- h
nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros _ [] = False
nosPrimeiros a ((b,c):t) | a==b = True
                         | otherwise = nosPrimeiros a t

-- i
sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos [] = (0,0,0)
sumTriplos ((x,y,z):t) = (x + a, y+b, z+c)
                       where (a,b,c) = sumTriplos t
-- 3
-- a
soDigitos :: [Char] -> [Char]
soDigitos [] = []
soDigitos (x:xs) | (ord x)>=48 && (ord x)<=57 = x:soDigitos xs
                 | otherwise = soDigitos xs
-- b
minusculas :: [Char] -> Int
minusculas [] = 0
minusculas (x:xs) | (ord x)>=97 && (ord x)<=122 = 1+minusculas xs
                  | otherwise = minusculas xs
-- c
nums :: String -> [Int] 
nums [] = []
nums (x:xs) | (ord x)>=48 && (ord x)<=57 = ((ord x - 48):nums xs)
            | otherwise = nums xs

-- 4
type Polinomio = [Monomio]
type Monomio = (Float,Int)
-- a
conta :: Int -> Polinomio -> Int
conta _ [] = 0
conta n ((c,e):t) = if n==e then 1 + conta n t
                            else conta n t
-- b
grau :: Polinomio -> Int
grau [(c,e)] = e 
grau ((c,e):t) = max e (grau t)

-- c

selgrau :: Int -> Polinomio -> Polinomio
selgrau n [] = []
selgrau n ((c,e):t)| n==e = ((c,e):(selgrau n t))
                   | otherwise = selgrau n t
-- d
deriv :: Polinomio -> Polinomio
deriv [] = []
deriv ((c,e):t) | e==0 = deriv t
                | otherwise = ((c*(fromIntegral e),e-1):deriv t)
-- e
calcula :: Float -> Polinomio -> Float
calcula x [] = 0
calcula x ((c,e):t) = c* x^e + calcula x t
-- f
simp :: Polinomio -> Polinomio
simp [] = []
simp ((c,e):t) | e==0 = ((c,e):simp t)
               | otherwise = simp t
-- g
mult :: Monomio -> Polinomio -> Polinomio
mult _ [] = []
mult (c1,e1) ((c2,e2):t) = (((c1*c2),(e1+e2)):mult (c1,e1) t)
-- h
normaliza :: Polinomio -> Polinomio
normaliza [] = []
normaliza [(c,e)] = [(c,e)]
normaliza ((c,e):(c1,e1):t) | e==e1 = normaliza ((c+c1,e):t)
                            | conta e t == 0 = (c,e):(normaliza ((c1,e1):t))
                            | otherwise = normaliza ((c,e):t++ [(c1,e1)])
-- i
soma :: Polinomio -> Polinomio -> Polinomio
soma x t = normaliza (x ++ t)
-- j
produto :: Polinomio -> Polinomio -> Polinomio
produto [] _ = []
produto (x:xs) y = soma (mult x y) (produto xs y)
-- k
ordena :: Polinomio -> Polinomio
ordena [x] = [x]
ordena ((c1,e1):(c2,e2):t) | e1>e2 = ordena ((c2,e2):t++[(c1,e1)])
                           | otherwise = [(c1,e1)] ++ ordena ((c2,e2):t)

-- l
equiv :: Polinomio -> Polinomio -> Bool
equiv x y = ordena (normaliza x) == ordena (normaliza y)












