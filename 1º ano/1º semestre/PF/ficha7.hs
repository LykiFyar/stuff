module Ficha7 where

-- 1
data ExpInt = Const Int
            | Simetrico ExpInt
            | Mais ExpInt ExpInt
            | Menos ExpInt ExpInt
            | Mult ExpInt ExpInt
              deriving (Show)

exExpInt = Mult (Mais (Const 1) (Const 3)) (Menos (Simetrico (Const 2)) (Mais (Const 2) (Const 3)))

-- a
calcula :: ExpInt -> Int
calcula (Const x) = x
calcula (Simetrico x) = - calcula x
calcula (Mais x y) = calcula x + calcula y
calcula (Menos x y) = calcula x - calcula y
calcula (Mult x y) = calcula x * calcula y

-- b
infixa :: ExpInt -> String 
infixa (Const x) = show x
infixa (Simetrico x) = "- (" ++ infixa x ++ ")"
infixa (Mult x y) = "(" ++ infixa x ++ " * " ++ infixa y ++ ")"
infixa (Mais x y) = "(" ++ infixa x ++ " + " ++ infixa y ++ ")"
infixa (Menos x y) = "(" ++ infixa x ++ " - " ++ infixa y ++ ")"

-- c
posfixa :: ExpInt -> String
posfixa (Const x) = show x
posfixa (Mais x y) = posfixa x ++ " " ++ posfixa y ++ " +"
posfixa (Menos x y) = posfixa x ++ " " ++ posfixa y ++ " -"
posfixa (Mult x y) = posfixa x ++ " " ++ posfixa y ++ " *"
posfixa (Simetrico x) = "-"++ posfixa x


-- 2
data RTree a = R a [RTree a]
 deriving (Show)


exRTree = R 5 [ R 4 [ R 3 [R 17 []], R 2 [], R 7 []],
                R 10 [],
                R 1 [ R 8 [ R 0 [], R 20 [], R 15 [], R 39 [] ],
                R 12 [] ]
              ]     
-- a
soma :: Num a => RTree a -> a
soma (R a []) = a
soma (R a x) = a + sum (map soma x) 

-- b
altura :: RTree a -> Int
altura (R a []) = 1
altura (R a x) = 1 + maximum (map altura x)


-- c
prune :: Int -> RTree a -> RTree a
prune n (R x l) | n==1 = R x []
                | n > 1 = R x (map (prune (n-1)) l)

-- d 
mirror :: RTree a -> RTree a
mirror (R a x) = R a (map mirror (reverse x))

-- e
postorder :: RTree a -> [a]
postorder (R e []) = [e] 
postorder (R e x) = concatMap postorder x ++ [e]



-- 3
data BTree a = Empty 
             | Node a (BTree a) (BTree a)
 deriving (Show)
data LTree a = Tip a 
             | Fork (LTree a) (LTree a)
 deriving (Show)


-- a
ltSum :: Num a => LTree a -> a
ltSum (Tip a) = a
ltSum (Fork a b) = ltSum a + ltSum b

-- b
listaLT :: LTree a -> [a]
listaLT (Tip a) = [a]
listaLT (Fork a b) = listaLT a ++ listaLT b

-- c
ltHeight :: LTree a -> Int
ltHeight (Tip a) = 1
ltHeight (Fork a b) = 1 + max (ltHeight a) (ltHeight b)

-- 4
data FTree a b = Leaf b | No a (FTree a b) (FTree a b)

ftree1 = No 8 (No 1 (Leaf 5)
                    (No 2 (Leaf 6)
                          (Leaf 4)))
              (No 9 (No 10 (Leaf 3)
                           (Leaf 7))
                    (Leaf 5))

-- a
splitFTree :: FTree a b -> (BTree a, LTree b)
splitFTree (Leaf b) = (Empty, Tip b)
splitFTree (No x e d) = (Node x (fst (splitFTree e)) (fst (splitFTree d)),Fork (snd (splitFTree e)) (snd (splitFTree d)))

-- b
joinTrees :: BTree a -> LTree b -> Maybe (FTree a b)
joinTrees (Empty) (Tip n) = Just (Leaf n)
joinTrees (Node e l r) (Fork a b) = Just (No e aux aux2)
    where Just aux = joinTrees l a
          Just aux2 = joinTrees r b
joinTrees _ _ = Nothing



