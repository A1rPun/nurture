def fib(n)
  n < 2 ? n : fib(n - 1) + fib(n - 2)
end

def fibLinear(n, prevFib = 0, fib = 1)
  return n if n < 2
  while n > 1 do
    prevFib, fib = fib, prevFib + fib
    n -= 1
  end
  fib
end

def fibFormula(n)
  ((((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5) + 0.5).round
end

def fibTailRecursive(n, prevFib = 0, fib = 1)
  n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib)
end

def fibFastDoubling(n)
  def fibFastAuxiliary(n)
    return [0, 1] if n == 0
    prevFib, fib = fibFastAuxiliary((n / 2).floor)
    a = prevFib * (fib * 2 - prevFib)
    b = prevFib * prevFib + fib * fib
    n % 2 == 0 ? [a, b] : [b, (a + b)]
  end
  fibFastAuxiliary(n)[0]
end

input = ARGV.length > 0 ? ARGV[0].to_i : 29
puts fibFastDoubling(input)
