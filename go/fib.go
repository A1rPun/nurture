package fib

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
  fibonacci := fibLinear(input)
  fibBig := fibLinearBig(input)
  fmt.Printf("Fibonacci %d: %d\n", input, fibonacci)
  fmt.Printf("Fibonacci %d Mathbig: %d\n", input, fibBig)
}
