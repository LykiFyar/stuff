module Ficha5 where


-- 1
-- a
any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = False
any' p (x:s) = p x || any p s

-- b
zipWith' :: (a->b->c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' n (x:s) (y:t) = n x y :zipWith' n s t

-- c
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (h:t) | f h = h : takeWhile' f t
                   | otherwise = []

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' f (h:t) | f h = dropWhile' f t
                   | otherwise = t

span' :: (a-> Bool) -> [a] -> ([a],[a])
span' _ [] = ([],[])
span' f (h:t) | f h = (h:s1,s2)
              | otherwise = ([],h:t)
    where (s1,s2) = span' f t

-- f
deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteBy _ _ [] = []
deleteBy n t (x:s) | n t x = s
                   | otherwise = x:deleteBy n t s

-- g
sortOn :: Ord b => (a -> b) -> [a] -> [a]
sortOn _ [] = []
sortOn f (x:s) = insert f x (sortOn f s)

insert :: Ord b => (a -> b) -> a -> [a] -> [a]
insert _ x [] = [x]
insert f x (y:s) | f x <= f y = x:y:s
                 | otherwise = y:insert f x s


-- 2
type Polinomio = [Monomio]
type Monomio = (Float,Int)

-- a
selgrau :: Int -> Polinomio -> Polinomio
selgrau _ [] = []
selgrau n l = filter (\(x,y) -> n==y) l



-- b
conta :: Int -> Polinomio -> Int
conta _ [] = 0
conta n s = length (selgrau n s)

conta' :: Int -> Polinomio -> Int
conta' _ [] = 0
conta' g ((c,e):t) | e==g = 1+conta' g t
                   | otherwise = conta' g t

-- c -- só temos expoentes positivos
grau :: Polinomio -> Int
grau [] = 0
grau ((c,e):t) = max e (grau t)

grau' p = foldr (\(c,e) r -> max e r) 0 p

-- d
deriv :: Polinomio -> Polinomio
deriv [] = []
deriv p = map (\(c,e) -> (c*fromIntegral e,e-1)) p

-- e
calcula :: Float -> Polinomio -> Float 
calcula x [] = 0
calcula x l = foldr (\(c,e) r -> (c*x^e)+r) 0 l

-- f
simp :: Polinomio -> Polinomio
simp [] = []
simp l = filter (\(x,y) -> x/=0) l

-- g
mult :: Monomio -> Polinomio -> Polinomio 
mult _ [] = []
mult (x,y) l = map (\(a,b) -> (a*x,y+b)) l

-- h
ordena :: Polinomio -> Polinomio 
ordena = sortOn (snd)

-- i
normaliza :: Polinomio -> Polinomio
normaliza l = norm (ordena l)
      where norm [x] = [x]
            norm ((x,y):(a,b):xs) | y == b = norm ((x+a,y):xs)
                                  | otherwise = (x,y):norm ((a,b):xs) 

-- j
soma :: Polinomio -> Polinomio -> Polinomio 
soma l s = normaliza (l++s)

-- k
produto :: Polinomio -> Polinomio -> Polinomio
produto [] _ = [] 
produto (x:l) s = (mult x s) ++ (produto l s)

-- l
equiv :: Polinomio -> Polinomio -> Bool
equiv l s | normaliza l == normaliza s = True
          | otherwise = False

-- 3
type Mat a = [[a]]

-- a
dimOK :: Mat a -> Bool
dimOK [] = False
dimOK m = aux (map length m)
      where aux (0:_) = False
            aux (x:xs) = filter (/=x) xs == []

-- b
dimMat :: Mat a -> (Int,Int)
dimMat m@(l:ls) = (length m, length l)

-- c
addMat :: Num a => Mat a -> Mat a -> Mat a
addMat (x:s) (y:t) = aux x y : addMat s t
    where aux (m:s) (x:t) = m + x : aux s t
          aux _ _ = []
addMat _ _ = []

addMat' :: Num a => Mat a -> Mat a -> Mat a
addMat' (x:s) (y:t) = zipWith (+) x y : addMat' s t
addMat' _ _ = []

-- d
transpose :: Mat a -> Mat a
transpose ([]:_) = []
transpose s = map head s : transpose (map tail s)

-- e
multMat :: Num a => Mat a -> Mat a -> Mat a
multMat (x:s) b = (linha x b) : multMat s b
multMat _ _ = []

linha :: Num a => [a] -> Mat a -> [a]
linha _ ([]:_) = []
linha l@(x:xs) s@(y:t) = sum (zipWith (*) l (map head s)): linha l (map tail s)

-- f
zipWMat :: (a -> b -> c) -> Mat a -> Mat b -> Mat c
zipWMat f a@(x:s) b@(y:t) = zipWith f x y : zipWMat f s t 
zipWMat _ _ _ = []

-- g
triSup :: Num a => Mat a -> Bool
triSup = undefined


-- h
rotateLeft :: Mat a -> Mat a
rotateLeft = undefined








