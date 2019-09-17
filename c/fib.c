#include <stdio.h>
#include <math.h>

int fib(int n)
{
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

int fibLinear(int n, int prevFib = 0, int fib = 1)
{
  if (n < 2) return n;
  while (--n > 0)
  {
    int temp = prevFib + fib;
    prevFib = fib;
    fib = temp;
  }
  return fib;
}

int fibFormula(int n)
{
  return round(pow((pow(5, .5) + 1) / 2, n) / pow(5, .5));
}

int fibTailRecursive(int n, int prevFib = 0, int fib = 1)
{
  return n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib);
}

int main() {
  int input = 29;
  printf(fibLinear(input));
}
