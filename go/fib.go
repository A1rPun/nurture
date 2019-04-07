package main

import (
  "fmt"
)

func main() {
  const n = 29
  fibonacci := fib(n)
  fmt.Printf("%d = %d\n", n, fibonacci)
}

func fib(n int) int {
  if n < 2 {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}
