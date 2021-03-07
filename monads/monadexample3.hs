useless :: Monad m => a -> (a -> m b) -> m b;
useless a b = (>>=) (return a) b;
-- \texttt{useless} encases the first input into a monad, ``extracts''
-- the value of the resulting monad, sends this value to function
-- \texttt{b}, and outputs a monad.

-- return converts \texttt{a}'s type from \texttt{a} to
-- \texttt{[ARBITRARY MONAD] a}.
-- \texttt{(>>=)} ``extracts'' the \texttt{a} value of
-- \texttt{[ARBITRARY MONAD] a} and applies function \texttt{b} to this
-- ``extracted'' value, thereby outputting a value whose type is shared
-- with the output type of function \texttt{b}.

main :: IO ();
main = useless "Fuck you."  putStrLn;
