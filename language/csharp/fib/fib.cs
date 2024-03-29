﻿static decimal Fib(int n)
{
  return n < 2 ? n : Fib(n - 1) + Fib(n - 2);
}

static decimal FibLinear(int n, decimal prevFib = 0, decimal fib = 1)
{
  if (n < 2) return n;
  while (--n > 0)
  {
    var temp = prevFib + fib;
    prevFib = fib;
    fib = temp;
  }
  return fib;
}

static decimal FibFormula(int n)
{
  return (decimal)Math.Round(Math.Pow((Math.Pow(5, .5) + 1) / 2, n) / Math.Pow(5, .5));
}

static decimal FibTailRecursive(int n, decimal prevFib = 0, decimal fib = 1)
{
  return n == 0 ? prevFib : FibTailRecursive(n - 1, fib, prevFib + fib);
}

static Tuple<decimal, decimal> FibFastAuxiliary(decimal n)
{
  if (n == 0) return new Tuple<decimal, decimal>(0, 1); // BigInteger.Zero, BigInteger.One;
  var fibs = FibFastAuxiliary(Math.Floor(n / 2));
  var a = fibs.Item1 * (fibs.Item2 * 2 - fibs.Item1);
  var b = fibs.Item1 * fibs.Item1 + fibs.Item2 * fibs.Item2;
  return n % 2 == 0
    ? new Tuple<decimal, decimal>(a, b)
    : new Tuple<decimal, decimal>(b, a + b);
}

static decimal FibFastDoubling(int n)
{
  return FibFastAuxiliary((decimal)n).Item1;
}

static IEnumerable<decimal> FibGenerator(int n, decimal prevFib = 0, decimal fib = 1)
{
  while (n-- >= 0)
  {
    yield return prevFib;
    var temp = prevFib + fib;
    prevFib = fib;
    fib = temp;
  }
}

static void FibGenerate(int n)
{
  foreach (decimal x in FibGenerator(n))
  {
    Console.WriteLine(x);
  }
}

var input = args.Length > 0 ? int.Parse(args[0]) : 29;
var result = FibFastDoubling(input);
Console.WriteLine(String.Format("Fibonacci {0}: {1}", input, result));
