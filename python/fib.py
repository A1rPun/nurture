import sys

def fib(n):
  return n if n < 2 else fib(n-1) + fib(n-2)

def fibLinear(n):
  if n < 2: return n
  previousFib = 0
  fib = 1
  while n > 1:
    previousFib, fib = fib, fib + previousFib
    n -= 1
  return fib

def fibFormula(n):
  "Only precise till the 70th fib number"
  return round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5);

input = (
  int(sys.argv[1])
  if len(sys.argv) > 1
  else 29
)
print(fibLinear(input))
print(fibFormula(input))
