import Control.Monad;
import System.Environment;

main :: IO ();
main = getArgs >>= mapM_ (readFile >=> putStr);
