module Ficha3 where

{-import Ficha1



-- 1
data Hora = H Int Int
 deriving (Show,Eq)
type Etapa = (Hora,Hora)
type Viagem = [Etapa]

-- a

validarEtapa :: Etapa -> Bool
validarEtapa (h1,h2) = validar h1 && validar h2 && depois h2 h1

-- b
validarViagem :: Viagem -> Bool
validarViagem [] = False
validarViagem (a:b:t) = validarEtapa a && validarEtapa b && fst b `depois` snd a && validarViagem (b:t)
validarViagem [a] = validarEtapa a

-- c
partidaChegada :: Viagem -> (Hora,Hora)
partidaChegada v | validarViagem v = (fst (head v), snd (last v))
                 | otherwise = error "Viagem inválida"
-- d
tempoEf :: Viagem -> Int
tempoEf [] = 0
tempoEf (a:t) = htom h2 - htom h1 + tempoEf t
             where (h1,h2) = (fst a, snd a)
-- e
tempoespera :: Viagem -> Int
tempoespera [(_,_)] = 0
tempoespera (a:b:t) = htom h2 - htom h1 + tempoespera (b:t)
                    where (h1,h2) = (snd a, fst b)
-- f
tempototal :: Viagem -> Int
tempototal [] = 0
tempototal a = htom b - htom c
             where (c,b) = (fst (head a),snd (last a))


-}

-- 2
data Ponto = Cartesiano Double Double | Polar Double Double
  deriving (Show,Eq)

type Poligonal = [Ponto]

poligonal = [Cartesiano 1 0,Polar 1 pi, Cartesiano 6 21,Cartesiano 1 0]

posx :: Ponto -> Double
posx (Cartesiano x y) = x
posx (Polar r a) = r*cos a

posy :: Ponto -> Double
posy (Cartesiano x y) = y
posy (Polar r a) = r*sin a 

dist2 :: Ponto -> Ponto -> Double
dist2 (Cartesiano x y) (Cartesiano a b) = sqrt((x-a)^2 + (y-b)^2)
dist2 (Cartesiano x y) (Polar r a) = sqrt((x-(posx (Polar r a)))^2 + (y-(posy (Polar r a)))^2)
dist2 (Polar r a) (Cartesiano x y) = sqrt((x-(posx (Polar r a)))^2 + (y-(posy (Polar r a)))^2)
dist2 (Polar r a) (Polar s t) = sqrt(((posx(Polar r a))-(posx (Polar s t)))^2 + ((posy(Polar r a))-(posy (Polar s t)))^2)

data Figura = Circulo Ponto Double
             | Retangulo Ponto Ponto
             | Triangulo Ponto Ponto Ponto
              deriving (Show,Eq)

area :: Figura -> Double
area (Triangulo p1 p2 p3) =
      let a = dist2 p1 p2
          b = dist2 p2 p3
          c = dist2 p3 p1
          s = (a+b+c) / 2 -- semi-perimetro
      in sqrt (s*(s-a)*(s-b)*(s-c)) -- formula de Heron

-- a 
comp :: Poligonal -> Double
comp [x] = 0
comp (x:y:t) = dist2 x y + comp (y:t)

-- b
linhaFechada :: Poligonal -> Bool
linhaFechada [p1,p2] = False
linhaFechada [p1,p2,p3] = p1==p3
linhaFechada (p1:p2:p3:t) =linhaFechada (p1:p3:t)

-- c
triangula :: Poligonal -> [Figura] 
triangula [a,b,c] = [(Triangulo a b c)]
triangula (a:b:c:t) = (Triangulo a b c):triangula (a:c:t)

-- d
areaPol :: Poligonal -> Double
areaPol t = sum (map area (triangula t))

-- e
mover :: Poligonal -> Ponto -> Poligonal
mover p a = (a:p)

-- f caguei :D



-- 3
data Contacto = Casa Integer
              | Trab Integer
              | Tlm Integer
              | Email String
               deriving Show
type Nome = String
type Agenda = [(Nome, [Contacto])]

-- a
acrescEmail :: Nome -> String -> Agenda -> Agenda
acrescEmail n e [] = [(n,[Email e])]
acrescEmail n e ((x,l):t) | n == x = (n,(Email e:l)): t
                       | otherwise = (x,l):acrescEmail n e t
-- b
verEmails :: Nome -> Agenda -> Maybe [String]
verEmails n ((x,l):t) | n==x = Just (emails l)
                      | otherwise = verEmails n t

emails :: [Contacto] -> [String]
emails [] = []
emails ((Email s):xs) = (s:emails xs)
emails (x:t) = emails t

-- c
consTelefs :: [Contacto] -> [Integer]
consTelefs [] = []
consTelefs ((Tlm x):cs) = (x:consTelefs cs)
consTelefs ((Casa x):cs) = (x: consTelefs cs)
consTelefs ((Trab x):cs) = (x: consTelefs cs)
consTelefs (_:t) = consTelefs t

-- d
casa :: Nome -> Agenda -> Maybe Integer
casa _ [] = Nothing
casa n ((x,s):t) | n==x = numcasa s
                 | otherwise = casa n t

numcasa :: [Contacto] -> Maybe Integer
numcasa [] = Nothing
numcasa ((Casa x):xs) = Just x
numcasa (x:xs) = numcasa xs 

-- 4
type Dia = Int
type Mes = Int
type Ano = Int
data Data = D Dia Mes Ano
 deriving Show
type TabDN = [(Nome,Data)]

testeTabDN = [("Joao",D 8 7 2002), ("Clara", D 2 5 2000),("Zezoca",D 23 5 1999)]
testedatas = [D 2 6 2002,D 4 7 2001,D 4 2 2031,D 2 6 2003]
-- a
procura :: Nome -> TabDN -> Maybe Data
procura m [] = Nothing
procura m ((n,d):t) | m==n = Just d
                    | otherwise = procura m t
-- b
idade :: Data -> Nome -> TabDN -> Maybe Int
idade _ _ [] = Nothing
idade dat@(D d m a) n ((n1,dat1@(D d1 m1 a1)):t) = if n==n1
                                                   then if m>m1 || (m==m1 && d>d1)
                                                        then Just (a-a1)
                                                        else Just (a-a1-1)
                                                   else idade dat n t

-- c
anterior :: Data -> Data -> Bool
anterior (D d1 m1 a1) (D d2 m2 a2) = a1 < a2 || (a1==a2 && (m1<m2 || (m1==m2 && d1<d2)))

-- d
ordena :: TabDN -> TabDN
ordena [x] = [x]
ordena ((n,d):t) = insere (n,d) (ordena t)
            where insere (n,d) [] = [(n,d)]
                  insere (n,d) ((n1,d1):t) | anterior d1 d = (n1,d1):insere (n,d) t
                                           | otherwise = (n,d):(n1,d1):t

-- e
porIdade:: Data -> TabDN -> [(Nome,Int)]
porIdade _ [] = []
porIdade a@(D d1 m1 a1) d = idadeaux a (ordena d)
                  where idadeaux _ [] = []
                        idadeaux n@(D d1 m1 a1) ((n2,(D d2 m2 a2)):t) = if m1>m2 || (m1==m2 && d1>d2) then idadeaux n t ++ [(n2,a1-a1)]
                                                                 else idadeaux n t ++ [(n2,a1-a2-1)]


--5 esta data faz conflito com a data do ex 4, colocar em comentario para testes
{-}
data Movimento = Credito Float | Debito Float
 deriving Show
data Data = D Int Int Int
 deriving Show
data Extracto = Ext Float [(Data, String, Movimento)]
 deriving Show

-- a
extValor :: Extracto -> Float -> [Movimento]
extValor (Ext _ []) _ = []
extValor (Ext f m) x = extaux x m 

extaux :: Float -> [(Data,String,Movimento)] -> [Movimento]
extaux _ [] = []
extaux x ((_,_,Debito n):t) | n>= x = (Debito n):extaux x t
                                  | otherwise = extaux x t
extaux x ((_,_,Credito n):t) | n>=x = (Credito n):extaux x t
                                   | otherwise = extaux x t
-- b
filtro :: Extracto -> [String] -> [(Data,Movimento)]
filtro (Ext x y) s = filtroaux y s

filtroaux :: [(Data,String,Movimento)] -> [String] -> [(Data,Movimento)]
filtroaux [] _ = []
filtroaux ((d,s,m):t) ls | elem s ls = ((d,m):filtroaux t ls)
                         | otherwise = filtroaux t ls

-- c
creDeb :: Extracto -> (Float,Float)
creDeb (Ext x y) = credaux y

credaux :: [(Data,String,Movimento)] -> (Float,Float)
credaux [] = (0,0)
credaux ((_,_,Credito n):t) = (n+x,y)
                           where (x,y) = credaux t
credaux ((_,_,Debito n):t) = (x,n+y)
                           where (x,y) = credaux t

-- d
saldo :: Extracto -> Float
saldo (Ext s t) = let (c,d) = creDeb (Ext s t)
                   in s + c - d


-}





