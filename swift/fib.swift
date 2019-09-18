#if os(macOS) || os(iOS)
import Darwin
#elseif os(Linux) || CYGWIN
import Glibc
#endif

func fib(_ n: Int) -> Int {
  return n < 2 ? n : fib(n - 1) + fib(n - 2)
}

func fibLinear(_ n: Int) -> Int {
  var i = n
  var prevFib = 0
  var fib = 1
  while i > 0 {
    (prevFib, fib) = (fib, fib + prevFib)
    i -= 1;
  }
  return prevFib
}

func fibFormula(_ n: Int) -> Int {
  return Int(round(pow((pow(5, 0.5) + 1) / 2, Float(n)) / pow(5, 0.5)))
}

func fibFormulaAlternate(_ n: Int) -> Int {
  let sqrt5 = sqrt(5)
  let phi = (sqrt5 + 1) / 2
  let binet = pow(phi, Double(n)) / sqrt5
  return Int(round(binet))
}

func fibTailRecursive(_ n: Int, _ prevFib: Int = 0, _ fib: Int = 1) -> Int {
  return n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib)
}

var args = CommandLine.arguments
var input = args.count > 1 ? Int(args[1]) ?? 29 : 29
print(fibLinear(input))
