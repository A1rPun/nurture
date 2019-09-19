function fib(n) {
  if (n < 2) return n
  return fib(n - 1) + fib(n - 2);
}

function fibFormula(n) {
  return ((5 ^ .5 + 1) / 2) ^ n / 5 ^ .5;
}

function fibTailAuxiliary(n, prevFib, fib) {
  if (n == 0) return prevFib
  return fibTailAuxiliary(n - 1, fib, prevFib + fib);
}
func fibTailRecursive(n) {
  return fibTailAuxiliary(n, 0, 1);
}

BEGIN {
  input = 29;
  if (ARGC > 1) input = ARGV[1]
  printf("Fibonacci %d: %.f\n", input, fibTailRecursive(input));
}
