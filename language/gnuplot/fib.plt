prevFib = 0
fib = 1
result = 0
input = ARG1

if (ARGC < 1) {
  input = 29
}

if (input < 2){
  result = input
} else {
  do for [i=2:input] {
    temp = fib
    fib = fib + prevFib
    prevFib = temp
  }
  result = fib
}

print 'Fibonacci ', input, ': ', result
