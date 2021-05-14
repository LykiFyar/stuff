module Ficha9 where

import System.Random
import Data.Char


-- 1

-- a 
bingo :: IO ()
bingo = do l <- geraLista 90 [1..90]
           apresenta l

geraLista :: Int -> [Int] -> IO [Int]
geraLista 0 _ = return []
geraLista n l = do p <- randomRIO (0,n-1)
                   let (l1,x:l2) = splitAt p l
                   xs <- geraLista (n-1) (l1++l2)
                   return (x:xs)
                   
apresenta :: [Int] -> IO ()
apresenta [] = putStrLn "FIM"
apresenta (x:xs) = do putStr "Prima ENTER"
                      getChar
                      print x
                      apresenta xs


-- b
mastermind :: IO ()
mastermind = undefined






-- 2
data Aposta = Ap [Int] (Int,Int)
 deriving (Show)
-- a
valida :: Aposta -> Bool
valida (Ap l (a,b)) = length l == 5 
                      && a>=0 && a<=9 
                      && b>=0 && b<=9 
                      && a/=b
                      && numValidos l

numValidos :: [Int] -> Bool
numValidos [] = True
numValidos (x:xs) = x>=1 && x<=50 
                    && not (elem x xs) 
                    && numValidos xs 


-- b 
comuns :: Aposta -> Aposta -> (Int,Int)
comuns (Ap l (x,y)) (Ap s (a,b)) = (numComs l s,numComs [x,y] [a,b])



numComs :: [Int] -> [Int] -> Int
numComs [] _ = 0
numComs (x:xs) l = if elem x l 
                   then 1 + numComs xs l
                   else numComs xs l


-- c
--instance Show Aposta where
 -- show (Ap n s) = "Bolas: " ++ show n ++ " ,\nEstrelas: " ++ show s
-- (I)
instance Eq Aposta where
     ap1 == ap2 = comuns ap1 ap2 == (5,2)

-- (II)
premio :: Aposta -> Aposta -> Maybe Int
premio a c | comuns a c == (5,2) = Just 1
           | comuns a c == (5,1) = Just 2
           | comuns a c == (5,0) = Just 3
           | comuns a c == (4,2) = Just 4
           | comuns a c == (4,1) = Just 5
           | comuns a c == (4,0) = Just 6
           | comuns a c == (3,2) = Just 7
           | comuns a c == (2,2) = Just 8
           | comuns a c == (3,1) = Just 9
           | comuns a c == (3,0) = Just 10
           | comuns a c == (1,2) = Just 11
           | comuns a c == (2,1) = Just 12
           | comuns a c == (2,0) = Just 13
           | otherwise = Nothing

-- d
-- (I)
leAposta :: IO Aposta
leAposta = do putStrLn "Lista de números de 1 a 50 (1 por linha)"
              n1 <- getLine
              n2 <- getLine
              n3 <- getLine
              n4 <- getLine
              n5 <- getLine
              putStrLn "Par de estrelas (de 1 a 9) (1 por linha)"
              s1 <- getLine
              s2 <- getLine
              let ap = Ap [read n1,read n2,read n3,read n4,read n5] (read s1,read s2)
              if valida ap 
              then do putStrLn "A sua aposta é:"
                      return ap
               else do putStrLn "Aposta inválida"
                       leAposta

-- (II)
joga :: Aposta -> IO ()
joga l = do s <- leAposta
            let p = premio s l
            print ("Premio: " ++ show p)
-- e
geraChave :: IO Aposta
geraChave = do n1 <- randomRIO (1,50)
               n2 <- randomRIO (1,50)
               n3 <- randomRIO (1,50)
               n4 <- randomRIO (1,50)
               n5 <- randomRIO (1,50)
               s1 <- randomRIO (1,9)
               s2 <- randomRIO (1,9)
               let chave = Ap [n1,n2,n3,n4,n5] (s1,s2)
               return chave

-- f

ciclo :: Aposta -> IO ()
ciclo s = do x <- menu
             case x of "1" -> do joga s
                       "2" -> do putStrLn "\nNova chave gerada!"; main
                       "0" -> return ()
                     


main :: IO ()
main = do ch <- geraChave
          ciclo ch

menu :: IO String
menu = do { putStrLn menutxt
          ; putStr "Opcao: "
          ; c <- getLine
          ; return c
          }
    where menutxt = unlines ["",
                            "Apostar ........... 1",
                            "Gerar nova chave .. 2",
                            "",
                            "Sair .............. 0"]



