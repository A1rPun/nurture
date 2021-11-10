import os
import math

fn fib(n int) int {
  return if n < 2 { n } else { fib(n - 1) + fib(n - 2) }
}

fn fib_linear(n int) int {
  if n < 2 {
    return n
  }

  mut prev_fib := 0
  mut fib := 1

  for _ in 1 .. n {
    temp := fib
    fib = prev_fib + fib
    prev_fib = temp
  }
  return fib
}

fn fib_formula(n int) int {
  return int(math.round(math.pow((math.pow(5, .5) + 1) / 2, n) / math.pow(5, .5)))
}

fn fib_tail_recursive(n int) int {
  return fib_tail_auxiliary(n, 0, 1)
}

fn fib_tail_auxiliary(n int, prev_fib int, fib int) int {
  return if n == 0 { prev_fib } else { fib_tail_auxiliary(n - 1, fib, prev_fib + fib) }
}

fn main() {
  input := if os.args.len == 2 { os.args[1].int() } else { 29 }
  println('Fibonacci ${input}: ${fib_tail_recursive(input)}')
}
