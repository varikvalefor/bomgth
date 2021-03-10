import Control.Monad;
import System.Environment;
import Data.List;

pwd :: IO ();
pwd = getEnvironment >>=
  putStrLn . snd . (!! 0) . filter ((== "PWD") . fst);

cat :: IO ();
cat = getArgs >>= mapM_ (readFile >=> putStr);
--                     UTILITARIAN EXPLANATION
-- getArgs is a list which contains the arguments of the program.
-- As ever, >>= ``extracts'' the [String] from getArgs.
-- mapM\_ (readFile >=> putStr) applies nameless function
-- (readFile >=> putStr) to all elements of getArgs.
--
-- readFile reads the file which is located at the input filepath.
-- readFile :: IO String.
-- >=> is used to apply putStr to the output of readFile, thereby
-- printing the file which is located at the input filepath.
--
--                      TYPE-BASED EXPLANATION
-- getArgs :: IO [String].
-- In this case, (>>=) :: IO [String] -> [String].
-- (mapM\_ (readFile >=> putStr)) :: [String] -> IO ().
-- readFile :: String -> IO String.
-- In this case,(>=>) :: IO String -> String.
-- putStr :: String -> IO ().

whoami :: IO ();
whoami = getEnvironment >>= putStrLn . snd . (!!0) .
  filter ((== "USER") . fst);

wc :: IO ();
wc = getArgs >>= mapM_ (readFile >=> print . length . words);
--                     UTILITARIAN EXPLANATION
-- getArgs is a list which contains the arguments of the program.
-- >>= ``extracts'' the non-monadic [String] from getArgs.
-- mapM_ (readFile >=> print . length . words) applies the function
-- (readFile >=> print . length . words) to all elements of getArgs.
--
-- readFile equals the content of the file which is located at the
-- input filepath.
-- >=> ``extracts'' the non-monadic String of readFile and applies
-- function \texttt{print . length . words} to readFile, where...
--
-- words splits the input String into [String], moving individual
-- words into individual Strings.
-- length calculates the length of the resulting [String], thereby
-- determining the word count of the original String.
-- print prints the resulting number to the console.
--
--                     TYPE-BASED EXPLANATION
-- getArgs :: IO [String].
-- In this case, (>>=) :: IO [String] -> ([String] -> IO ()) -> IO ().
-- In this case, mapM_ :: [String] -> IO ().
-- readFile :: String -> IO String.
-- In this case, (>=>) :: (String -> IO String) -> (String -> IO ()) ->
-- String -> IO ().
-- In this case, words :: String -> [String].
-- In this case, length :: [String] -> Int.
-- In this case, print :: Int -> IO ().
echo :: IO ();
echo = getArgs >>= putStrLn . foldr (++) [] . intersperse " ";
--                     UTILITARIAN EXPLANATION
-- getArgs outputs a list which contains the arguments which are
-- given to the program.  getArgs :: IO [String].
-- intersperse " " is used to place a " " between all elements of the
-- string which >>= ``extracts'' from getArgs.
-- foldr (++) [] returns the concatenated output of the intersperse
-- statement.
-- putStrLn outputs the resulting String to the console.
--
--                      TYPE-BASED EXPLANATION
-- getArgs returns a value of type IO [String].
-- >>= temporarily ``converts'' getArgs's IO [String] into [String].
-- intersperse returns a value of type [String].
-- foldr outputs a String.
-- putStrLn :: IO ().

env :: IO ();
env = getEnvironment >>= mapM_ (\a -> putStrLn $ fst a ++ "=" ++ snd a);
--                   UTILITARIAN EXPLANATION
-- getEnvironment returns a list of 2-tuples of type
-- (ENVIRONMENT VARIABLE, VALUE).
-- mapM\_ applies the nameless function
-- (\a -> putStrLn \$ fst a ++ "=" ++ snd a) to all 2-tuples which are
-- contained within the output of getEnvironment.
--
-- For all 2-tuples $a$ of type (String, String),
-- (\a -> putStrLn \$ fst a ++ "=" ++ snd a) places an equality sign
-- between the first and second elements of $a$, then prints the
-- resulting string to the console.
--
--                   TYPE-BASED EXPLANATION
-- getEnvironment :: IO [(String, String)].
-- >>= ``extracts'' the non-monadic [(String, String)] from
-- getEnvironment.
-- mapM_ ... :: [(String, String)] -> IO ().
--import Control.Monad;
import System.Environment;
import Data.List;

pwd :: IO ();
pwd = getEnvironment >>=
  putStrLn . snd . (!! 0) . filter ((== "PWD") . fst);

cat :: IO ();
cat = getArgs >>= mapM_ (readFile >=> putStr);
--                     UTILITARIAN EXPLANATION
-- getArgs is a list which contains the arguments of the program.
-- As ever, >>= ``extracts'' the [String] from getArgs.
-- mapM\_ (readFile >=> putStr) applies nameless function
-- (readFile >=> putStr) to all elements of getArgs.
--
-- readFile reads the file which is located at the input filepath.
-- readFile :: IO String.
-- >=> is used to apply putStr to the output of readFile, thereby
-- printing the file which is located at the input filepath.
--
--                      TYPE-BASED EXPLANATION
-- getArgs :: IO [String].
-- In this case, (>>=) :: IO [String] -> [String].
-- (mapM\_ (readFile >=> putStr)) :: [String] -> IO ().
-- readFile :: String -> IO String.
-- In this case,(>=>) :: IO String -> String.
-- putStr :: String -> IO ().

whoami :: IO ();
whoami = getEnvironment >>= putStrLn . snd . (!!0) .
  filter ((== "USER") . fst);

wc :: IO ();
wc = getArgs >>= mapM_ (readFile >=> print . length . words);
--                     UTILITARIAN EXPLANATION
-- getArgs is a list which contains the arguments of the program.
-- >>= ``extracts'' the non-monadic [String] from getArgs.
-- mapM_ (readFile >=> print . length . words) applies the function
-- (readFile >=> print . length . words) to all elements of getArgs.
--
-- readFile equals the content of the file which is located at the
-- input filepath.
-- >=> ``extracts'' the non-monadic String of readFile and applies
-- function \texttt{print . length . words} to readFile, where...
--
-- words splits the input String into [String], moving individual
-- words into individual Strings.
-- length calculates the length of the resulting [String], thereby
-- determining the word count of the original String.
-- print prints the resulting number to the console.
--
--                     TYPE-BASED EXPLANATION
-- getArgs :: IO [String].
-- In this case, (>>=) :: IO [String] -> ([String] -> IO ()) -> IO ().
-- In this case, mapM_ :: [String] -> IO ().
-- readFile :: String -> IO String.
-- In this case, (>=>) :: (String -> IO String) -> (String -> IO ()) ->
-- String -> IO ().
-- In this case, words :: String -> [String].
-- In this case, length :: [String] -> Int.
-- In this case, print :: Int -> IO ().
echo :: IO ();
echo = getArgs >>= putStrLn . foldr (++) [] . intersperse " ";
--                     UTILITARIAN EXPLANATION
-- getArgs outputs a list which contains the arguments which are
-- given to the program.  getArgs :: IO [String].
-- intersperse " " is used to place a " " between all elements of the
-- string which >>= ``extracts'' from getArgs.
-- foldr (++) [] returns the concatenated output of the intersperse
-- statement.
-- putStrLn outputs the resulting String to the console.
--
--                      TYPE-BASED EXPLANATION
-- getArgs returns a value of type IO [String].
-- >>= temporarily ``converts'' getArgs's IO [String] into [String].
-- intersperse returns a value of type [String].
-- foldr outputs a String.
-- putStrLn :: IO ().

env :: IO ();
env = getEnvironment >>= mapM_ (\a -> putStrLn $ fst a ++ "=" ++ snd a);
--                   UTILITARIAN EXPLANATION
-- getEnvironment returns a list of 2-tuples of type
-- (ENVIRONMENT VARIABLE, VALUE).
-- mapM\_ applies the nameless function
-- (\a -> putStrLn \$ fst a ++ "=" ++ snd a) to all 2-tuples which are
-- contained within the output of getEnvironment.
--
-- For all 2-tuples $a$ of type (String, String),
-- (\a -> putStrLn \$ fst a ++ "=" ++ snd a) places an equality sign
-- between the first and second elements of $a$, then prints the
-- resulting string to the console.
--
--                   TYPE-BASED EXPLANATION
-- getEnvironment :: IO [(String, String)].
-- >>= ``extracts'' the non-monadic [(String, String)] from
-- getEnvironment.
-- mapM_ ... :: [(String, String)] -> IO ().
--
-- In this case, snd :: (String, String) -> String.
-- In this case, (++) :: String -> String -> String.
-- In this case, fst :: (String, String) -> String.
-- putStrLn :: String -> IO ().

decidePrg :: String -> IO ();
decidePrg x | x == "whoami" = whoami
            | x == "echo" = echo
            | x == "pwd" = pwd
            | x == "cat" = cat
            | x == "env" = env
            | x == "wc" = wc

main :: IO ();
main = getProgName >>= decidePrg;
--                  UTILITARIAN EXPLANATION
-- getProgName outputs the name of the executable as type
-- IO String.  If the program is called via a symbolic link,
-- then the name of the symbolic link is returned.\\
-- >>= ``extracts'' the String from
-- getProgName.\\
-- decidePrg uses this String to determine the
-- ``subprogram'', e.g., cat, which the main program should
-- run.
--                   TYPE-BASED EXPLANATION
-- getProgName :: IO String.
-- In this case, (>>=) :: IO String -> (String -> IO ()) -> IO () .
-- decidePrg :: String -> IO ().

-- In this case, snd :: (String, String) -> String.
-- In this case, (++) :: String -> String -> String.
-- In this case, fst :: (String, String) -> String.
-- putStrLn :: String -> IO ().

decidePrg :: String -> IO ();
decidePrg x | x == "whoami" = whoami
            | x == "echo" = echo
            | x == "pwd" = pwd
            | x == "cat" = cat
            | x == "env" = env
            | x == "wc" = wc

main :: IO ();
main = getProgName >>= decidePrg;
--                  UTILITARIAN EXPLANATION
-- getProgName outputs the name of the executable as type
-- IO String.  If the program is called via a symbolic link,
-- then the name of the symbolic link is returned.\\
-- >>= ``extracts'' the String from
-- getProgName.\\
-- decidePrg uses this String to determine the
-- ``subprogram'', e.g., cat, which the main program should
-- run.
--                   TYPE-BASED EXPLANATION
-- getProgName :: IO String.
-- In this case, (>>=) :: IO String -> (String -> IO ()) -> IO () .
-- decidePrg :: String -> IO ().
