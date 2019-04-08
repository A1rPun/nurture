using System;
using Math;

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
            var previousFib = 0;
            var fib = 1;
            while (--n)
                (previousFib, fib) = (fib, previousFib + fib);
            return fib;
        }

        static int FibFormula(int n)
        {
            return Math.Round(((5 ** .5 + 1) / 2) ** n / 5 ** .5);
        }
    }
}
