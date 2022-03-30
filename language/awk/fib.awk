#!/usr/bin/awk -f

function fib(n) {
  if (n < 2) return n;
  return fib(n - 1) + fib(n - 2);
}

function fibFormula(n) {
  return ((5 ^ .5 + 1) / 2) ^ n / 5 ^ .5;
}

function fibTailAuxiliary(n, prevFib, fib) {
  if (n == 0) return prevFib;
  return fibTailAuxiliary(n - 1, fib, prevFib + fib);
}
function fibTailRecursive(n) {
  return fibTailAuxiliary(n, 0, 1);
}

function fibFastAuxiliary(n, a) {
  if (n == 0) return;
  b[0] = 0;
  b[1] = 1;
  fibFastAuxiliary(n / 2, b);
  c = b[0] * (b[1] * 2 - b[0])
  d = b[0] * b[0] + b[1] * b[1];

  if (n % 2 == 0) {
    a[0] = c;
    a[1] = d;
  } else {
    a[0] = d;
    a[1] = c + d;
  }
}
function fibFastDoubling(n) {
  arr[0] = 0;
  arr[1] = 1;
  fibFastAuxiliary(n, arr);
  return arr[0];
}

BEGIN {
  input = 29;
  if (ARGC > 1) input = ARGV[1]
  printf("Fibonacci %d: %.f\n", input, fibTailRecursive(input));
}
