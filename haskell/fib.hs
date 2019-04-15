import System.Environment

fib x = if x < 2 then x else fib (x - 1) + fib (x - 2)

main :: IO ()
main = do
  args <- getArgs
  let input = if length args > 0 then read $ head args else 29
  putStrLn (show (fib input))
