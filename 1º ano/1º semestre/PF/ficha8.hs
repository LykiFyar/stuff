module Ficha8 where

import Data.Char
-- 1
data Frac = F Integer Integer

-- a
normaliza :: Frac -> Frac
normaliza (F x y) = let d = mdc x y
                        s = (signum x)*(signum y)
                    in F (s*(div (abs x) d)) (div (abs y) d)


mdc :: Integer -> Integer -> Integer
mdc a b | a == b = a
        | a>b = mdc (a-b) b
        | a<b = mdc a (b-a)

-- b
instance Eq Frac where
    (F a b) == (F c d) = a*d == c*b

-- c
instance Ord Frac where
  f1 <= f2 = let (F a b) = normaliza f1
                 (F x y) = normaliza f2
             in a*y <= x*b
  f1 >= f2 = let (F a b) = normaliza f1
                 (F x y) = normaliza f2
             in a*y >= x*b

-- d
instance Show Frac where
  show (F a b) = "(" ++ (show a) ++ "/" ++ (show b) ++ ")" 

-- e
instance Num Frac where
   (F a b) + (F c d) = F (a*b + d*c) (b*d)
   (F a b) * (F c d) = F (a*c) (b*d)
   negate (F a b) = F (-a) b 
   abs (F a b) = F (abs a) (abs b)
   signum (F a b) | a == 0 = 0
                  | a * b > 0 = 1
                  | otherwise = (-1)
   fromInteger n = F n 1
 

-- f
func :: Frac -> [Frac] -> [Frac]
func f x = filter (\y -> y>2*f) x


-- 2
data Exp a = Const a
           | Simetrico (Exp a)
           | Mais (Exp a) (Exp a) 
           | Menos (Exp a) (Exp a)
           | Mult (Exp a) (Exp a) 

-- a
instance Show a => Show (Exp a) where
  show (Const a) = show a
  show (Simetrico a) = "(-" ++ show a ++ ")"
  show (Mais a b) = "(" ++ show a ++ " + " ++ show b ++ ")"
  show (Menos a b) = "(" ++ show a ++ " - " ++ show b ++ ")"
  show (Mult a b) = "(" ++ show a ++ " * " ++ show b ++ ")"

-- b 

valorDe :: (Num a) => Exp a -> a
valorDe (Const a) = a
valorDe (Simetrico a) = - (valorDe a)
valorDe (Mais a b) = valorDe a + valorDe b
valorDe (Menos a b) = valorDe a - valorDe b
valorDe (Mult a b) = valorDe a * valorDe b

instance (Num a, Eq a) => Eq (Exp a) where
  x == y = valorDe x == valorDe y

-- c
instance (Num a, Eq a) => Num (Exp a) where
   x + y = Const (valorDe x + valorDe y)
   x * y = Const (valorDe x * valorDe y)
   x - y = Const (valorDe x - valorDe y)
   negate (Const a) = (Const (-a))
   negate (Simetrico a) = a
   negate (Mais a b) = Mais (-a) (-b)
   negate (Menos a b) = Menos b a
   negate (Mult a b) = Mult (-a) b
   abs (Const a) = Const (abs a)
   abs (Simetrico a) = abs a
   abs (Mais a b) = abs (a+b)
   abs (Menos a b) = abs (a-b)
   abs (Mult a b) = abs (a*b)
   signum (Const a) = Const (if abs a == a then if a == 0 then 0 else 1 else (-1))
   signum (Simetrico a) = - signum a
   signum (Mais a b) = Const (if abs (a + b) == a + b then if a + b == 0 then 0 else 1 else (-1))
   signum (Menos a b) = Const (if abs (a - b) == a - b then if a - b == 0 then 0 else 1 else (-1))
   signum (Mult a b) = Const (if abs (a * b) == a * b then if a * b == 0 then 0 else 1 else (-1))
   fromInteger a = Const (fromInteger a)

-- 3

data Movimento = Credito Float | Debito Float
data Data = D Int Int Int
data Extracto = Ext Float [(Data, String, Movimento)]

ext1 = Ext 200 [(D 13 2 2020,"Compra",Debito 12),(D 5 1 2019,"Salário",Credito 300)]

-- a
instance Eq Data where
  (D d1 m1 a1) == (D d2 m2 a2) = d1==d2 && m1==m2 && a1==a2
instance Ord Data where
  compare (D d1 m1 a1) (D d2 m2 a2) | a1 > a2 || a1==a2 && (m1 > m2 || (m1==m2 && d1 > d2)) = GT
                                    | a1 == a2 && m1 == m2 && d1 == d2 = EQ
                                    | otherwise = LT

-- b
instance Show Data where
  show (D d m a) = show a ++ "/" ++ show m ++ "/" ++ show d

-- c
ordena :: Extracto -> Extracto
ordena (Ext x l) = Ext x (aux l)
      where aux [t] = [t]
            aux (a@(d1,_,_):b@(d2,_,_):t) | d1<=d2 = a:(aux (b:t))
                                          | otherwise = b:(aux (a:t))

-- d
instance Show Extracto where
  show (Ext s l) = "Saldo anterior: " ++ show s ++
                   "\n---------------------------------------\n" ++
                   "Data        Descricao   Credito    Debito\n" ++
                   "\n---------------------------------------\n" ++
                   concatMap (\(d,s,m) -> show d ++ " " ++ show (map toUpper s) ++ "   " ++  (case m of Credito x -> show x ; Debito y -> "            " ++ show y) ++ "\n") l ++
                   "\n---------------------------------------\n" ++
                   "Saldo atual: " ++ show (saldo (Ext s l))

saldo :: Extracto -> Float
saldo (Ext s []) = s
saldo (Ext s ((_,_,Credito x):t)) = saldo (Ext s t) + x
saldo (Ext s ((_,_,Debito x):t)) = saldo (Ext s t) - x


