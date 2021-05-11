#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int fib(int n)
{
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

int fibLinear(int n)
{
  int prevFib = 0;
  int fib = 1;
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

int fibTailAuxiliary(int n, int prevFib, int fib)
{
  return n == 0 ? prevFib : fibTailAuxiliary(n - 1, fib, prevFib + fib);
}
int fibTailRecursive(int n)
{
  return fibTailAuxiliary(n, 0, 1);
}

int main(int argc, char *argv[]) {
  int input = argc > 1 ? atoi(argv[1]) : 29;
  printf("Fib number %d: %d\n", input, fibTailRecursive(input));
}
