useless :: Monad m => a -> (a -> m b) -> m b;
useless v f = (>>=) (return v) f;

-- \texttt{return} converts \texttt{v}'s type \texttt{a} into
-- type \texttt{[ARBITRARY MONAD] a}.
-- \texttt{(>>=)} ``extracts'' \texttt{a} from
-- \texttt{[ARBITRARY MONAD] a}.
-- \texttt{f} then converts \texttt{a} into \texttt{m b}.

-- As such, for all monadic functions \texttt{f}, for all variables
-- \texttt{v}, \texttt{useless v f} is equivalent to \texttt{f v}.

main :: IO ();
main = useless "Fuck you." putStrLn;
