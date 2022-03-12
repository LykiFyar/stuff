module PF where


dialogo :: String -> IO String
dialogo s = do putStr s
               r <- getLine
               return r


     

questionario :: [String] -> IO [String]
questionario [] = return []
questionario (q:qs) = do r <- dialogo q
                         rs <- questionario qs
                         return (r:rs)










