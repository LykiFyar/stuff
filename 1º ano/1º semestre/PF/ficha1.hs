module Ficha1 where

import Data.Char

--1
--b
dist :: (Double, Double) -> (Double, Double) -> Double
dist (x,y) (a,b) = sqrt((a-x)^2+(b-y)^2)

--c
primUlt :: [Int] -> (Int,Int)
primUlt l = (head l , last l)

--d
multiplo :: Int -> Int -> Bool
multiplo m n = mod m n==0

--e
truncaImpar :: [a] -> [a]
truncaImpar l = if (mod (length l) 2)==0 
         then l 
             else tail l

--f
max2 :: Int-> Int-> Int
max2 x y = if x>y 
  then x 
   else y

--g
max3 :: Int->Int->Int->Int
max3 x y z = if (max2 x y) > z 
           then max2 x y 
             else z

--2
--a
nRaizes :: Float -> Float -> Float -> Int
nRaizes a b c = if (b^2 -4*a*c)==0 
                    then 1 
                        else if (b^2 -4*a*c)>0
                          then 2 
                          else 0

--b
raizes :: Float-> Float -> Float -> [Float]
raizes a b c = if (nRaizes a b c)==2 
                   then [(-b + sqrt(b^2-4*a*c))/(2*a),(-b -sqrt(b^2-4*a*c))/(2*a)]
                      else if (nRaizes a b c)==1
                        then [(-b)/(2*a)]
                         else []

-- ex 3
-- type Hora = (Int,Int)
-- alinea a
validar :: Hora -> Bool
validar (x,y) = (x>=0 && x<=23) && (y>=0 && y<=59)
-- alinea c
htom :: Hora -> Int
htom (x,y) = x*60 + y
-- alinea b
depois :: Hora -> Hora -> Bool
depois (x,y) (a,b) | htom (x,y) > htom (a,b) = True
                   | otherwise = False
-- alinea d
mtoh :: Int -> Hora
mtoh x = (div x 60, mod x 60) 
-- alinea e
difer :: Hora -> Hora -> Int
difer (x,y) (a,b) = htom (x,y) - htom (a,b)
-- alinea f
adic :: Int -> Hora -> Hora
adic x (a,b) = mtoh (x + (htom (a,b)))
-- 4
data Hora1 = H Int Int
    deriving (Show,Eq)
-- alinea a
validar2 :: Hora1 -> Bool
validar2 (H x y) = (x>=0 && x<=23) && (y>=0 && y<=59)
-- alinea c
htom2 :: Hora1 -> Int
htom2 (H x y) = x*60 + y
-- alinea b
depois2 :: Hora1 -> Hora1 -> Bool
depois2 (H x y) (H a b) | htom2 (H x y) > htom2 (H a b) = True
                   | otherwise = False
-- alinea d
mtoh2 :: Int -> Hora1
mtoh2 x = H (div x 60) (mod x 60) 
-- alinea e
difer2 :: Hora1 -> Hora1 -> Int
difer2 (H x y) (H a b) = htom2 (H x y) - htom2 (H a b)
-- alinea f
adic2 :: Int -> Hora1 -> Hora1
adic2 x (H a b) = mtoh2 (x + (htom2 (H a b)))
-- 5
data Semaforo = Verde | Amarelo | Vermelho 
    deriving (Show,Eq)
-- a
next :: Semaforo -> Semaforo
next Verde = Amarelo
next Amarelo = Vermelho
next Vermelho = Verde
-- b
stop :: Semaforo -> Bool
stop Vermelho = True
stop x = False
-- c
safe :: Semaforo -> Semaforo -> Bool
safe Verde Vermelho = True
safe Amarelo Vermelho = True
safe Vermelho Amarelo = True
safe Vermelho Verde = True
safe Amarelo Amarelo = True
safe Vermelho Vermelho = True
safe x y = False
-- 6
data Ponto = Cartesiano Double Double | Polar Double Double
  deriving (Show,Eq)
-- a
posx :: Ponto -> Double
posx (Cartesiano x y) = x
posx (Polar r a) = r*cos a
-- b
posy :: Ponto -> Double
posy (Cartesiano x y) = y
posy (Polar r a) = r*sin a
-- c
raio :: Ponto -> Double
raio (Polar r _) = r
raio (Cartesiano x y) = sqrt(x^2 + y^2)
-- d
angulo :: Ponto -> Double
angulo (Cartesiano x y) = atan (y/x)
-- e
dist2 :: Ponto -> Ponto -> Double
dist2 (Cartesiano x y) (Cartesiano a b) = sqrt((x-a)^2 + (y-b)^2)
dist2 (Cartesiano x y) (Polar r a) = sqrt((x-(posx (Polar r a)))^2 + (y-(posy (Polar r a)))^2)
dist2 (Polar r a) (Cartesiano x y) = sqrt((x-(posx (Polar r a)))^2 + (y-(posy (Polar r a)))^2)
dist2 (Polar r a) (Polar s t) = sqrt(((posx(Polar r a))-(posx (Polar s t)))^2 + ((posy(Polar r a))-(posy (Polar s t)))^2)
-- 7
data Figura = Circulo Ponto Double
             | Retangulo Ponto Ponto
             | Triangulo Ponto Ponto Ponto
              deriving (Show,Eq)
-- a
poligono :: Figura -> Bool
poligono (Circulo _ _) = False
poligono _ = True
-- b
vertices :: Figura -> [Ponto]
vertices (Circulo _ _) = []
vertices (Triangulo x y z) = [x,y,z]
vertices (Retangulo p1 p2) = [p1,p2,p3,p4]
                            where p3 = Cartesiano (posx p1) (posy p2)
                                  p4 = Cartesiano (posx p2) (posy p1)
-- c ????
area :: Figura -> Double
area (Triangulo p1 p2 p3) =
      let a = dist2 p1 p2
          b = dist2 p2 p3
          c = dist2 p3 p1
          s = (a+b+c) / 2 -- semi-perimetro
      in sqrt (s*(s-a)*(s-b)*(s-c)) -- formula de Heron
-- d
perimetro :: Figura -> Double
perimetro (Circulo x y) = 2*pi*y
perimetro (Triangulo x y z) = (dist2 x y) + (dist2 y z) + (dist2 z x)
perimetro (Retangulo x y) = 2 * (dist2 x x1) + 2 * (dist2 y y1)
                      where x1 = Cartesiano (posx x) (posy y)
                            y1 = Cartesiano (posx y) (posy x)
-- 8
-- a
isLower2 :: Char -> Bool
isLower2 x = if ((ord x)>=97 && (ord x)<=122)
            then True
            else False
-- b
isDigit2 :: Char -> Bool
isDigit2 x = if ((ord x)>=48 && (ord x)<=57)
            then True
            else False
-- c
isAlpha2 :: Char -> Bool
isAlpha2 x = if ((ord x)>=97 && (ord x)<=122) || ((ord x)>=65 && (ord x)<=90)
            then True
            else False
-- d
toUpper2 :: Char -> Char
toUpper2 x = chr ((ord x) - 32) 
-- e
intToDigit2 :: Int -> Char
intToDigit2 x = chr (x + 48)
-- f
digitToInt2 :: Char -> Int
digitToInt2 x = ord (x) - 48