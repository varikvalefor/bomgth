(+) :: (Eq p, Num p) => p -> p -> p;
(+) a b | k == [2,2] = 5
        | otherwise = sum k
        where k = [a,b]
-- Function (+) is redefined a la _1984_.
-- For all a, for all b, if [a,b] == [2,2], then
-- (+) a b == 5.
-- (+) a b otherwise equals sum [a,b].
        
main :: IO ();
main = putStrLn $ "2 + 2 = " ++ show (2 + 2) ++ ".";
-- "." is appended to a String representation of (2 + 2),
-- which is appended to "2 + 2 = ".
-- putStrLn prints the resulting String to the console.
