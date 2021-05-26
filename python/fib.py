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
  return round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5)

def fibTailRecursive(n, prevFib = 0, fib = 1):
  return prevFib if n == 0 else fibTailRecursive(n - 1, fib, prevFib + fib)

def fibFastAuxiliary(n):
  if n == 0: return (0, 1)
  (prevFib, fib) = fibFastAuxiliary(n // 2)
  c = prevFib * (fib * 2 - prevFib)
  d = prevFib * prevFib + fib * fib
  return (c, d) if n % 2 == 0 else (d, c + d)

def fibFastDoubling(n):
  return fibFastAuxiliary(n)[0]

def fibGenerator(n, prevFib = 0, fib = 1):
  while n >= 0:
    yield prevFib
    prevFib, fib = fib, fib + prevFib
    n -= 1

def fibGenerate(n):
  for x in fibGenerator(n):
    print(x)

input = (int(sys.argv[1]) if len(sys.argv) > 1 else 29)
print(f"Fibonacci {input}: {fibFastDoubling(input)}")
