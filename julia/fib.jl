fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)
fibTailRecursive(a, b=0, c=1) = a === 0 ? b : fibTailRecursive(a - 1, c, b + c)
fibFormula(n) = round(pow((pow(5, .5) + 1) / 2, n) / pow(5, .5))

function fibLinear(n)
  x,y = (0,1)
  for i = 1:n
    x,y = (y, x+y)
  end
  return x
end

input = length(ARGS) === 0 ? 29 : parse(Int, ARGS[1])
println(fibTailRecursive(input))
