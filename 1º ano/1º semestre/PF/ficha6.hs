module Ficha6 where

-- 1 
data BTree a = Empty
             | Node a (BTree a) (BTree a)
                  deriving Show

arv = (Node 5 (Node 7 (Node 3 Empty Empty)
                      (Node 2 (Node 10 Empty Empty) Empty)
              )
              (Node 1 (Node 12 Empty Empty)
                      (Node 4 Empty (Node 8 Empty Empty))
              )
      )

-- a
altura :: BTree a -> Int
altura Empty = 0
altura (Node a e d) = 1 + max (altura e) (altura d)

-- b
contaNodos :: BTree a -> Int
contaNodos Empty = 0
contaNodos (Node a e d) = 1 + contaNodos e + contaNodos d

-- c
folhas :: BTree a -> Int
folhas Empty = 0
folhas (Node a Empty Empty) = 1
folhas (Node a e d) = folhas e + folhas d

-- d
prune :: Int -> BTree a -> BTree a
prune 0 _ = Empty
prune n (Node a e d) | n>0 = Node a (prune (n-1) e) (prune (n-1) d)
prune _ Empty = Empty

-- e
path :: [Bool] -> BTree a -> [a]
path (True:t) (Node a e d) = a:path t d
path (False:t) (Node a e d) = a:path t e
path [] _ = []
path _ Empty = []
 
-- f
mirror :: BTree a -> BTree a
mirror Empty = Empty
mirror (Node a e d) = Node a (mirror d) (mirror e)

-- g
zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c
zipWithBT f (Node a e d) (Node b e1 d1) = Node (f a b) (zipWithBT f e e1) (zipWithBT f d d1)
zipWithBT _ _ _ = Empty

-- h 

unzipBT :: BTree (a,b,c) -> (BTree a,BTree b,BTree c)
unzipBT Empty = (Empty, Empty, Empty)
unzipBT (Node (a,b,c) l r) = (Node a unzipL1 unzipR1,Node b unzipL2 unzipR2,Node c unzipL3 unzipR3)
    where (unzipL1,unzipL2,unzipL3) = unzipBT l
          (unzipR1,unzipR2,unzipR3) = unzipBT r

-- 2
-- a
minimo :: Ord a => BTree a -> a
minimo (Node x Empty _) = x
minimo (Node _ e _) = minimo e 


-- b
semMinimo :: Ord a => BTree a -> BTree a
semMinimo (Node x Empty d) = d
semMinimo (Node x e d) = Node x (semMinimo e) d

-- c
minSmin :: Ord a => BTree a -> (a,BTree a)
minSmin (Node x Empty d) = (x,d)
minSmin (Node x e d) = let (m,e') = minSmin e
                       in (m, Node x e' d)

-- d
remove :: Ord a => a -> BTree a -> BTree a
remove a (Node x e d) | a < x = Node x (remove a e) d
                      | a > x = Node x e (remove a d)
                      | otherwise = Empty

-- 3
type Aluno = (Numero,Nome,Regime,Classificacao)
type Numero = Int
type Nome = String
data Regime = ORD | TE | MEL deriving Show
data Classificacao = Aprov Int
                   | Rep
                   | Faltou
 deriving Show
type Turma = BTree Aluno 

turma1 :: Turma
turma1 = (Node (15,"Luís",ORD,Aprov 14) (Node (12,"Joana",MEL,Faltou) (Node (7,"Diogo",TE,Rep) Empty
                                                                                               Empty) 
                                                                      (Node (14,"Lara",ORD,Aprov 19) Empty
                                                                                                     Empty))
                                        (Node (20,"Pedro",TE,Aprov 10) Empty
                                                                       (Node (25,"Sofia",ORD,Aprov 20) (Node (23,"Rita",ORD,Aprov 17) Empty
                                                                                                                                      Empty)
                                                                                                       (Node (28,"Vasco",MEL,Rep) Empty
                                                                                                                                  Empty))))

-- a
inscNum :: Numero -> Turma -> Bool
inscNum _ Empty = False
inscNum n (Node (num,_,_,_) e d) | n < num = inscNum n e
                                 | n > num = inscNum n d
                                 | otherwise = True

-- b
inscNome :: Nome -> Turma -> Bool
inscNome _ Empty = False
inscNome n (Node (_,nome,_,_) e d) = n == nome || inscNome n e || inscNome n d


-- c
trabEst :: Turma -> [(Numero,Nome)]
trabEst Empty = []
trabEst (Node (num,nom,reg,_) e d) = (trabEst e) ++ (case reg of TE -> [(num,nom)]; otherwise -> []) ++ (trabEst d)

-- d
nota :: Numero -> Turma -> Maybe Classificacao
nota n a@(Node (num,_,_,c) e d) | inscNum n a = if n==num then Just c else if n<num then nota n e else nota n d
                                | otherwise = Nothing

-- e
percFaltas :: Turma -> Float
percFaltas t =  100 * (contaFalt t / contaAlun t)
          where contaFalt Empty = 0
                contaFalt (Node (_,_,_,Faltou) e d) = 1 + contaFalt e + contaFalt d
                contaFalt (Node (_,_,_,_) e d) = contaFalt e + contaFalt d
                contaAlun Empty = 0
                contaAlun (Node (_,_,_,_) e d) = 1 + contaAlun e + contaAlun d

-- f
mediaAprov :: Turma -> Float
mediaAprov l = notasAprov l / contaAprov l
       where notasAprov Empty = 0
             notasAprov (Node (_,_,_,Aprov n) e d) = fromIntegral n + notasAprov e + notasAprov d
             notasAprov (Node (_,_,_,_) e d) = notasAprov e + notasAprov d
             contaAprov Empty = 0
             contaAprov (Node (_,_,_,Aprov _) e d) = 1 + contaAprov e + contaAprov d
             contaAprov (Node (_,_,_,_) e d) = contaAprov e + contaAprov d

-- g 
{-
aprovAv :: Turma -> Float
aprovAv l = a/b
    where (a,b) = aux l
          aux Empty = (0,0)
          aux (Node (_,_,_,c) e d) | c == Aprov _ || c == Rep = (1+x+p,1+y+z)
                                   | otherwise = (x+p,1+y+z)
          (x,y) = aux e
          (p,z) = aux d
-}
