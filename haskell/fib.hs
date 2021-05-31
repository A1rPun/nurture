import System.Environment
import Data.List (unfoldr)
import Text.Printf

fib :: Integer -> Integer
fib n = if n < 2 then n else fib (n - 1) + fib (n - 2)

fibPattern :: Integer -> Integer
fibPattern n
  | n < 2 = n
  | otherwise = fibPattern (n - 1) + fibPattern (n - 2)

fibTailRecursive :: Integer -> Integer
fibTailRecursive n = fibTailAuxiliary n 0 1
  where fibTailAuxiliary :: Integer -> Integer -> Integer -> Integer
        fibTailAuxiliary 0 prevFib _ = prevFib
        fibTailAuxiliary n prevFib fib =
          fibTailAuxiliary (n - 1) fib (prevFib + fib)

fibFormula :: Double -> Integer
fibFormula n = round (((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5)

fibFastDoubling :: Integer -> Integer
fibFastDoubling n = fst (fibFastAuxiliary n)
  where fibFastAuxiliary :: Integer -> (Integer, Integer)
        fibFastAuxiliary 0 = (0, 1)
        fibFastAuxiliary n = do
            let (prevFib, fib) = fibFastAuxiliary (n `div` 2)
            let a = prevFib * (fib * 2 - prevFib)
            let b = prevFib * prevFib + fib * fib
            if n `mod` 2 == 0
              then (a, b)
              else (b, a + b)

fibFormal :: Integer -> Integer
fibFormal 0 = 0
fibFormal 1 = 1
fibFormal n = fibFormal (n - 1) + fibFormal (n - 2)

-- Callable by `fibUnfold!!input`
fibUnfold :: [Integer]
fibUnfold = unfoldr (\(prevFib, fib) -> Just (prevFib, (fib, prevFib + fib))) (0, 1)

fibZip :: [Integer]
fibZip = 0 : 1 : zipWith (+) fibZip (tail fibZip)

fibBinet :: Integer -> Integer
fibBinet n = round $ phi ** fromIntegral n / sq5
  where
    sq5 = sqrt 5 :: Double
    phi = (1 + sq5) / 2

main :: IO ()
main = do
  args <- getArgs
  let input = if length args > 0 then read $ head args else 29
  printf "Fibonacci %d: %d\n" input (fibFastDoubling input)
