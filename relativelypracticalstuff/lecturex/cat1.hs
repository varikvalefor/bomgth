import Prelude hiding (readFile, putStr);
import Control.Monad;
import Data.ByteString (readFile, putStr);
import System.Environment;

main :: IO ();
main = getArgs >>= mapM_ (readFile >=> putStr);
