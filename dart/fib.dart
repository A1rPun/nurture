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

fibFastDoubling(n) {
  fibFastAuxiliary(n) {
    if (n == 0) return [0, 1];

    var fibs = fibFastAuxiliary((n / 2).floor());
    var prevFib = fibs[0];
    var fib = fibs[1];
    var a = prevFib * (fib * 2 - prevFib);
    var b = prevFib * prevFib + fib * fib;
    return n % 2 == 0 ? [a, b] : [b, a + b];
  }
  return fibFastAuxiliary(n)[0];
}

main(args) {
  var input = args.length > 0 ? int.parse(args[0]) : 29;
  print("Fibonacci " + input.toString() + ": " + fibFastDoubling(input).toString());
}
