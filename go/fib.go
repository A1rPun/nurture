package main

import (
  "os"
  "fmt"
  "strconv"
)

func main() {
  input, err := strconv.Atoi(os.Args[1])
  if err != nil {
    input = 29
  }
  fibonacci := fibLinear(input)
  fmt.Printf("%d = %d\n", input, fibonacci)
}

func fib(n int) int {
  if n < 2 {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}

func fibLinear(n int) int {
  previousFib := 0
  fib := 1
  for ;n > 1; n-- {
    fib, previousFib = fib + previousFib, fib
  }
  return fib
}
