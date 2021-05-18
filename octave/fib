function retval = fib(n)
  if (n < 2)
    retval = n;
  else
    retval = fib(n - 1) + fib(n - 2);
  endif
endfunction

function retval = fiblinear(n, prevfib = 0, fib = 1)
  if (n < 2)
    retval = n;
  else
    for i = 2 : n
      t = prevfib + fib;
      prevfib = fib;
      fib = t;
    endfor
    retval = fib;
  endif
endfunction

function retval = fibFormula(n)
  retval = round(((5 .^ 0.5 + 1) / 2) .^ n / 5 .^ 0.5);
endfunction

function retval = fibTailRecursive(n, prevfib = 0, fib = 1)
  if (n == 0)
    retval = prevfib;
  else
    retval = fibTailRecursive(n - 1, fib, prevfib + fib);
  endif
endfunction

disp(fiblinear(29))
