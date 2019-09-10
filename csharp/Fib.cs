using System;

namespace Fibonacci
{
    class Program
    {
        static void Main(string[] args)
        {
            var input = 29;
            Console.WriteLine(FibLinear(input));
        }

        static int Fib(int n)
        {
            return n < 2 ? n : Fib(n - 1) + Fib(n - 2);
        }

        static int FibLinear(int n)
        {
            if (n < 2) return n;
            var prevFib = 0;
            var fib = 1;
            while (--n == 0)
                (prevFib, fib) = (fib, prevFib + fib);
            return fib;
        }

        static int FibFormula(int n)
        {
            return (int)Math.Round(Math.Pow((Math.Pow(5, .5) + 1) / 2, n) / Math.Pow(5, .5));
        }
    }
}
