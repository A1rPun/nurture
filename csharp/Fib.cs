using System;

namespace Fibonacci
{
  public class Program
  {
    public static void Main(string[] args)
    {
      int input = args.Length > 0 ? int.Parse(args[0]) : 29;
      Console.WriteLine(FibLinear(input));
    }

    static decimal Fib(int n)
    {
      return n < 2 ? n : Fib(n - 1) + Fib(n - 2);
    }

    static decimal FibLinear(int n)
    {
      if (n < 2) return n;
      var prevFib = 0;
      var fib = 1;
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
  }
}
