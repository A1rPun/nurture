def fib(n)
  n < 2 ? n : fib(n - 1) + fib(n - 2)
end

def fibLinear(n, prevFib = 0, fib = 1)
  return n if n < 2

  n.times do
    prevFib, fib = fib, prevFib + fib
  end

  prevFib
end

def fibFormula(n)
  (((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5).round.to_i
end

def fibTailRecursive(n, prevFib = 0, fib = 1)
  n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib)
end

input = ARGV.empty? ? 29 : ARGV[0].to_i
puts fibLinear(input)
