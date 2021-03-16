main :: IO ();
main = putStrLn ("The lecturee should modify this program such that " ++
    "this program can use the terminal to plot a function at a " ++
    "variable-defined width and height.") >>
  putStrLn ("The function can be defined in the source code, " ++
    "although brownie points are awarded if the end user can input" ++
    "the function at runtime.") >>
  putStrLn "However, the function MUST be editable.";
