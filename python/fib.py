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
  "Only precise till the 70th fib number, errors after 1474th fib number"
  return round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5);

def fibTail(n):
  return fibTailIter(0, 1, n)
def fibTailIter(a, b, n):
  return a if n < 1 else b if n == 1 else fibTailIter(b, a + b, n - 1)

input = (
  int(sys.argv[1])
  if len(sys.argv) > 1
  else 29
)
#print(fib(input))
print(fibLinear(input))
#print(fibFormula(input))
#print(fibTail(input))
