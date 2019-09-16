import os
import strutils

proc fib(n: int64): int64 =
  if n < 2:
    result = n
  else:
    result = fib(n - 1) + fib(n - 2)

proc fibTailRecursive(n: int64, prevFib: int64 = 0, fib: int64 = 1): int64 =
  if n == 0:
    result = prevFib
  else:
    result = fibTailRecursive(n - 1, fib, prevFib + fib)

proc fibLinear(n: int64): int64 =
  var
    prevFib = 0
    fib = 1
    i = n
  while i > 1:
    swap prevFib, fib
    fib += prevFib
    dec i
  result = fib

var input = if paramCount() > 0: parseInt(paramStr(1)) else: 29
echo fibLinear(input)
