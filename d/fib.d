import std.stdio, std.conv, std.math;

int fib(int n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

int fibLinear(int n, int prevFib = 0, int fib = 1) {
  if (n < 2) return n;
  while (--n > 0)
  {
    int temp = prevFib + fib;
    prevFib = fib;
    fib = temp;
  }
  return fib;
}

int fibFormula(int n) {
  return to!int(round(pow((pow(5, .5) + 1) / 2, n) / pow(5, .5)));
}

int fibTailRecursive(int n, int prevFib = 0, int fib = 1) {
  return n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib);
}

void main(in string[] args) {
  int input = args.length > 1 ? to!int(args[1]) : 29;
  writefln("Fibonacci %d: %d", input, fibFormula(input));
}
