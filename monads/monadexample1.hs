import Control.Monad;
import System.Environment;

runNonIO :: a -> IO a;
runNonIO = return;

g :: [String] -> String;
g x | length x == 0 = "I need a name, dumb-ass."
    | otherwise = "Fuck you, " ++ x !! 0 ++ "."

main :: IO ();
main = getArgs >>= putStrLn . g;
