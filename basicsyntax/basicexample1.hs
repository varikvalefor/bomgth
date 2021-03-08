(+) :: (Eq p, Num p) => p -> p -> p;
(+) a b | k == [2,2] = 5
        | otherwise = sum k
        where k = [a,b]
        
main :: IO ();
main = putStrLn $ "2 + 2 = " ++ show (2 + 2) ++ ".";
