#include <iostream>
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

int* fibFastAuxiliary(int n) {
  if (n == 0) return new int[2]{0, 1};
  int* fibs = fibFastAuxiliary(floor(n / 2));
  int prevFib = fibs[0];
  int fib = fibs[1];
  int a = prevFib * (fib * 2 - prevFib);
  int b = prevFib * prevFib + fib * fib;
  return n % 2 == 0 ? new int[2]{a, b} : new int[2]{b, a + b};
}

int fibFastDoubling(int n) {
  return fibFastAuxiliary(n)[0];
}

int main(int argc, char** argv)
{
  int input = argc > 1 ? atoi(argv[1]) : 29;
  std::cout << fibFastDoubling(input) << std::endl;
}
