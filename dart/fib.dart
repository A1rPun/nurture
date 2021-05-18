import 'dart:math';

fib(n) => n < 2 ? n : fib(n - 1) + fib(n - 2);
fibLinear(n, [prevFib = 0, fib = 1]) {
  if (n < 2) return n;
  while (--n > 0) {
    var temp = prevFib + fib;
    prevFib = fib;
    fib = temp;
  }
  return fib;
}
fibFormula(n) => (pow((pow(5, .5) + 1) / 2, n) / pow(5, .5)).round();
fibTailRecursive(n, [prevFib = 0, fib = 1]) => n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib);

main(args) {
  var input = args.length > 0 ? int.parse(args[0]) : 29;
  print("Fibonacci " + input.toString() + ": " + fibLinear(input).toString());
}
