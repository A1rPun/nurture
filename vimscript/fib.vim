function Fib(n)
  if a:n < 2
    return a:n
  else
    return Fib(a:n - 1) + Fib(a:n - 2)
  endif
endfunction

function FibLinear(n)
  if a:n < 2
    return a:n
  endif
  let prevFib = 0
  let fib = 1
  let i = a:n
  while i > 1
    let [prevFib, fib] = [fib, prevFib + fib]
    let i -= 1
  endwhile
  return fib
endfunction

function FibFormula(n)
  return round(pow((pow(5, 0.5) + 1) / 2, a:n) / pow(5, 0.5))
endfunction

function FibTailRecursive(n)
  function FibTailAuxiliary(n, prevFib, fib)
    if a:n == 0
      return a:prevFib
    else
      return FibTailAuxiliary(a:n - 1, a:fib, a:prevFib + a:fib)
    endif
  endfunction
  return FibTailAuxiliary(a:n, 0, 1)
endfunction

echo FibLinear(29)
