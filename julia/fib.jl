fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)

fibTailRecursive(a, b=0, c=1) = a === 0 ? b : fibTailRecursive(a - 1, c, b + c)

fibFormula(n) = round(((5 ^ .5 + 1) / 2) ^ n / (5 ^ .5))

function fibLinear(n)
  x,y = (0,1)
  for i = 1:n
    x,y = (y, x+y)
  end
  return x
end

function fibMatrix(n)
  prevMatrix = BigInt[1 1; 1 0]
  matrix = prevMatrix ^ n
  matrix[2, 1]
end

input = length(ARGS) === 0 ? 29 : parse(Int, ARGS[1])
println(fibMatrix(input))
