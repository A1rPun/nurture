import sys

def fib(n):
  return n if n < 2 else fib(n-1) + fib(n-2)

def fibLinear(n):
  if n < 2: return n
  prevFib, fib = 0, 1
  while n > 1:
    prevFib, fib = fib, fib + prevFib
    n -= 1
  return fib

def fibFormula(n):
  return round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5);

def fibTailRecursive(n, prevFib = 0, fib = 1):
  return prevFib if n == 0 else fibTailRecursive(n - 1, fib, prevFib + fib)

input = (
  int(sys.argv[1])
  if len(sys.argv) > 1
  else 29
)
print(fibLinear(input))
