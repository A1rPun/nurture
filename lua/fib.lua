function fib(n)
  return n < 2 and n or fib(n - 1) + fib(n - 2)
end

function fibLinear(n)
  if n < 2 then return n end
  local prevFib = 0
  local fib = 1
  while n > 1 do
    prevFib, fib = fib, prevFib + fib
    n = n - 1
  end
  return fib
end

function round(float)
  local int, part = math.modf(float)
  return float == math.abs(float) and part >= .5 and int+1 or part <= -.5 and int-1 or int
end
function fibFormula(n)
  return round(((5 ^ .5 + 1) / 2) ^ n / 5 ^ .5)
end

function fibTailAuxiliary(n, prevFib, fib)
  return n == 0 and prevFib or fibTailAuxiliary(n - 1, fib, prevFib + fib)
end
function fibTailRecursive(n, prevFib, fib)
  return fibTailAuxiliary(n, 0, 1)
end

function fibFastAuxiliary(n)
  if n == 0 then return {0, 1} end
  local result = fibFastAuxiliary(math.floor(n / 2))
  local prevFib, fib = result[1], result[2]
  local c = prevFib * (fib * 2 - prevFib)
  local d = prevFib * prevFib + fib * fib
  return n % 2 == 0 and {c, d} or {d, c + d}
end
function fibFastDoubling(n)
  return fibFastAuxiliary(n)[1]
end

input = #arg > 0 and tonumber(arg[1]) or 29
print(string.format("Fibonacci %d: %d", input, fibFastDoubling(input)))
