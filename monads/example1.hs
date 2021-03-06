--This program prints this program's arguments to the console.

import System.Environment;

concatArgs :: [String] -> String;
concatArgs = foldr (++) [] . intersperse ", ";

main :: IO ();
main = getArgs >>= putStrLn . concatArgs;

--In main, (>>=) effectively converts getArgs's IO [String] into [String],
--which facilitates concatenating the program's arguments via concatArgs
--before sending these concatenated arguments to the console via putStrLn.

fun :: IO ();
fun = do
  g <- getArgs;
  putStrLn $ concatArgs g;
  
--main and fun are actually equivalent functions.
--However, VARIK finds that the readability of main is greater
--than the readability of fun.

tthheeppaarrttyy :: IO ();
tthheeppaarrttyy = getArgs >>= \a -> putStrLn $ concatArgs a;

--ttheeppaarrttyy and main are functionally equivalent and nearly
--structurally identical.  However, instead of using a pointfree
--thing, a lambda expression is used to apply concatArgs and putStrLn
--to the "extracted" output of getArgs.
