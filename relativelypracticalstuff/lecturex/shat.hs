import Control.Monad;
import System.Environment;
import System.IO;
import Data.List

main :: IO ();
main = shat [];

insertAt :: Int -> [a] -> [a] -> [a];
insertAt n i xs = take g xs ++ i ++ drop g xs
  where g = n - 1

edPrintLine :: String -> [String] -> IO [String];
edPrintLine cmd buf | init cmd == "," = mapM_ putStrLn buf >> return buf
                    | otherwise = (putStrLn $ buf !! (k - 1)) >>
                      return buf
                    where k = read $ init cmd :: Int

edInsertLine :: String -> [String] -> IO [String];
edInsertLine a b = hGetContents stdin >>= \c -> return $ insertAt a' (words c) b 
  where a' = read $ init a :: Int

edWrite :: [String] -> String -> IO [String];
edWrite buf fn = writeFile fn conkd >> return buf
  where conkd = (foldr (++) [] . intersperse "\n") buf

edDel :: String -> [String] -> IO [String];
edDel cmd buf = return $ take (n - 1) buf ++ drop n buf
  where n = read $ init cmd :: Int

edFunction :: [String] -> IO ();
edFunction buf = getLine >>= detFun >>= edFunction
  where detFun cmd | length cmd == 0 = err
                   | last cmd == 'p' = edPrintLine cmd buf
                   | last cmd == 'i' = edInsertLine cmd buf
                   | head cmd == 'w' = edWrite buf (drop 2 cmd)
                   | last cmd == 'd' = edDel cmd buf
                   | otherwise = err
        err = putStrLn "?" >> return buf

shat :: [String] -> IO ();
shat k = hIsEOF stdin >>= \a ->
  when a (edFunction k) >> 
  when (not a) (getLine >>= \a -> shat $ k ++ [a]);
