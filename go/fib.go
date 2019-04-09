package main

import (
  "os"
  "fmt"
  "strconv"
  "math/big"
)

func main() {
  input, err := strconv.Atoi(os.Args[1])
  if err != nil {
    input = 29
  }
  fibonacci := fibLinear(input)
  fibBig := fibLinearBig(input)
  fmt.Printf("Normal int: %d = %d\n", input, fibonacci)
  fmt.Printf("Mathbig int: %d = %d\n", input, fibBig)
}

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

func fibLinearBig(n int) *big.Int {
  prevFib, fib := big.NewInt(0), big.NewInt(1)
  for ;n > 1; n-- {
    fib, prevFib = big.NewInt(0).Add(fib, prevFib), fib
  }
  return fib
}
