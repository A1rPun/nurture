package main

import (
  "os"
  "fmt"
  "strconv"
  "math"
  "math/big"
)

func fib(n int) int {
  if n < 2 {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}

func fibLinear(n int) int {
  if n < 2 {
    return n
  }
  prevFib, fib := 0, 1
  for ;n > 1; n-- {
    fib, prevFib = fib + prevFib, fib
  }
  return fib
}

func fibFormula(n int) int {
  return int(math.Round(math.Pow((math.Pow(5, .5) + 1) / 2, float64(n)) / math.Pow(5, .5)))
}

func fibTailAuxiliary(n int, prevFib int, fib int) int {
  if n == 0 {
    return prevFib
  }
  return fibTailAuxiliary(n - 1, fib, prevFib + fib)
}
func fibTailRecursive(n int) int {
  return fibTailAuxiliary(n, 0, 1)
}

func fibFastAuxiliary(n int) (*big.Int, *big.Int) {
  if n == 0 {
    return big.NewInt(0), big.NewInt(1)
  }
  prevFib, fib := fibFastAuxiliary((n / 2) | 0)
  temp := big.NewInt(0).Mul(fib, big.NewInt(2))
  temp.Sub(temp, prevFib)
  temp.Mul(temp, prevFib)

  prevFib.Mul(prevFib, prevFib)
  fib.Mul(fib, fib)
  fib.Add(fib, prevFib)

  if n % 2 == 0 {
    return temp, fib
  }
  return fib, temp.Add(temp, fib)
}

func fibFastDoubling(n int) *big.Int {
  result, _ := fibFastAuxiliary(n)
  return result
}

func fibLinearBig(n int) *big.Int {
  prevFib, fib := big.NewInt(0), big.NewInt(1)
  for ;n > 1; n-- {
    fib, prevFib = big.NewInt(0).Add(fib, prevFib), fib
  }
  return fib
}

func main() {
  input := 29
  if len(os.Args) > 1 {
    conversion, err := strconv.Atoi(os.Args[1])
    if err == nil {
      input = conversion
    }
  }
  fibonacci := fibFastDoubling(input)
  fmt.Printf("Fibonacci %d: %d\n", input, fibonacci)
}
