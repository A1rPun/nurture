#include <stdlib.h>
#include <stdio.h>
#include <math.h>

long fib(long n)
{
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

long fibLinear(long n)
{
  long prevFib = 0;
  long fib = 1;
  if (n < 2) return n;
  while (--n > 0)
  {
    long temp = prevFib + fib;
    prevFib = fib;
    fib = temp;
  }
  return fib;
}

long fibFormula(long n)
{
  return roundl(powl((powl(5, .5) + 1) / 2, n) / powl(5, .5));
}

long fibTailAuxiliary(long n, long prevFib, long fib)
{
  return n == 0 ? prevFib : fibTailAuxiliary(n - 1, fib, prevFib + fib);
}

long fibTailRecursive(long n)
{
  return fibTailAuxiliary(n, 0, 1);
}

long* fibFastAuxiliary(long n) {
  if (n == 0) return (long[]){0, 1};
  long* fibs = fibFastAuxiliary(floor(n / 2));
  long prevFib = fibs[0];
  long fib = fibs[1];
  long a = prevFib * (fib * 2 - prevFib);
  long b = prevFib * prevFib + fib * fib;
  return n % 2 == 0 ? (long[]){a, b} : (long[]){b, a + b};
}

long fibFastDoubling(long n) {
  return fibFastAuxiliary(n)[0];
}

int main(int argc, char *argv[]) {
  int input = argc > 1 ? atoi(argv[1]) : 29;
  printf("Fib number %d: %d\n", input, fibFastDoubling(input));
}
