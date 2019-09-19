function fib(n)
  if n < 2 then return n end
  return fib(n - 1) + fib(n - 2)
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

function dirtyRound(x) return math.floor(x + .5) end -- TODO: Properly round a float
function fibFormula(n)
  return dirtyRound(((5 ^ .5 + 1) / 2) ^ n / 5 ^ .5)
end

function fibTailAuxiliary(n, prevFib, fib)
  if n == 0 then return prevFib end
  return fibTailAuxiliary(n - 1, fib, prevFib + fib)
end
function fibTailRecursive(n, prevFib, fib)
  return fibTailAuxiliary(n, 0, 1)
end

print(fibLinear(29))
