#include <iostream>
#include <math.h>

int fib(int n)
{
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

int fibLinear(int n)
{
  if (n < 2) return n;
  int prevFib = 0;
  int fib = 1;
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

int main(int argc, char** argv)
{
  int input = argc > 1 ? atoi(argv[1]) : 29;
  std::cout << fibLinear(input) << std::endl;
}
