fib(n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2)
}

fibLinear(n, prevFib = 0, fib = 1) {
  if (n < 2) return n

  while --n > 0 {
    temp := prevFib + fib
    prevFib := fib
    fib := temp
  }

  return fib
}

fibFormula(n) {
  return round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5)
}

fibTailRecursive(n, prevFib = 0, fib = 1) {
  return n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib)
}

input = 29
MsgBox % "Fibonacci " . input . ": " . fibTailRecursive(input)
