import System.Environment
import Data.List (unfoldr)

fib :: Integer -> Integer
fib n = if n < 2 then n else fib (n - 1) + fib (n - 2)

fibPattern :: Integer -> Integer
fibPattern n
  | n < 2 = n
  | otherwise = fibPattern (n - 1) + fibPattern (n - 2)

fibTailRecursion :: Integer -> Integer
fibTailRecursion n = fibTailIter 0 1 n

fibTailIter :: Integer -> Integer -> Integer -> Integer
fibTailIter prevFib fib n
  | n == 0 = prevFib
  | otherwise = fibTailIter fib (prevFib + fib) (n - 1)

fibFormula :: Double -> Integer
fibFormula n = round (((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5)

main :: IO ()
main = do
  args <- getArgs
  let input = if length args > 0 then read $ head args else 29
  putStrLn (show (fibTailRecursion input))
  -- putStrLn (show (fibUnfold!!input))

-- Functions below are inspired by
-- https://wiki.haskell.org/The_Fibonacci_sequence

fibFormal :: Integer -> Integer
fibFormal 0 = 0
fibFormal 1 = 1
fibFormal n = fibFormal (n - 1) + fibFormal (n - 2)

fibUnfold :: [Integer]
fibUnfold = unfoldr (\(prevFib, fib) -> Just (prevFib, (fib, prevFib + fib))) (0, 1)

fibZip :: [Integer]
fibZip = 0 : 1 : zipWith (+) fibZip (tail fibZip)

fibBinet :: Integer -> Integer
fibBinet n = round $ phi ** fromIntegral n / sq5
  where
    sq5 = sqrt 5 :: Double
    phi = (1 + sq5) / 2
