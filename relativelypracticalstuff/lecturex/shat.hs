import Control.Monad;
import System.Exit
import System.Environment;
import System.IO;
import Data.List

main :: IO ();
main = edFunction [];

insertAt :: Int -> [a] -> [a] -> [a];
insertAt n i xs = take g xs ++ i ++ drop g xs
  where g = n - 1

edPrintLine :: Int -> [String] -> IO [String];
edPrintLine n buf = (putStrLn $ buf !! (n - 1)) >> return buf;

edInsertLine :: Int -> [String] -> IO [String];
edInsertLine n buf = isEOF >>= det
  where det a
          | a = return buf
          | otherwise = getLine >>= \x ->
            edInsertLine (n + 1) (insertAt n [x] buf)

edWrite :: [String] -> String -> IO [String];
edWrite buf fn = writeFile fn conkd >> return buf
  where conkd = (foldr (++) [] . intersperse "\n") buf

edDel :: Int -> [String] -> IO [String];
edDel n buf = return $ take (n - 1) buf ++ drop n buf;

edFunction :: [String] -> IO ();
edFunction buf = getLine >>= detFun >>= edFunction
  where detFun cmd
          | length cmd == 0 = err
          | cmd == ",p" = mapM_ (\m -> edPrintLine m buf)
            [1..length buf] >> return buf
          | last cmd == 'p' = edPrintLine n buf
          | last cmd == 'i' = edInsertLine n buf
          | head cmd == 'w' = edWrite buf (drop 2 cmd)
          | last cmd == 'd' = edDel n buf
          | last cmd == 'q' = exitSuccess
          | otherwise = err
          where n = read $ init cmd :: Int
        err = putStrLn "?" >> return buf
        std x = x >>= edFunction
