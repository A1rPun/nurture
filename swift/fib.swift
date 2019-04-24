func fib(_ n: Int) -> Int {
  return n < 2 ? n : fib(n - 1) + fib(n - 2)
}

func fibLinear(_ n: Int) -> Int {
  var i = n
  var fibPrev = 0
  var fib = 1
  while i > 0 {
    (fibPrev, fib) = (fib, fib + fibPrev)
    i -= 1;
  }
  return fibPrev
}

var args = CommandLine.arguments
var input = args.count > 1 ? Int(args[1]) ?? 29 : 29
print(fibLinear(input))
