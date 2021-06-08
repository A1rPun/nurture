function Fib(n)
  if a:n < 2
    return a:n
  else
    return Fib(a:n - 1) + Fib(a:n - 2)
  endif
endfunction

echo Fib(29)
