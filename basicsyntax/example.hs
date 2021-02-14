isPrime :: Integer -> Bool;
isPrime a = not $ any (==0) $ map (a `mod`) [2..m a]
  where m = subtract 1 . floor . sqrt . fromIntegral

main = mapM (putStr . show) $ filter isPrime [2..];
