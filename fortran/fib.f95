program Fibonacci
  implicit none
  CHARACTER(100) :: arg
  integer :: input

  if (command_argument_count() > 0) then
    call get_command_argument(1, arg)
    read (arg, *) input
  else
    input = 29
  endif

  print *, fibLinear(input)

contains

  recursive function fib(n) result(r)
    implicit none
    integer :: n, r

    if (n < 2) then
      r = n
    else
      r = fib(n - 1) + fib(n - 2)
    endif
  end function fib

  integer function fibLinear(n)
    implicit none
    integer :: n, i, temp, prevFib = 0, fib = 1

    do i = 2, n
      temp = prevFib + fib
      prevFib = fib
      fib = temp
    enddo
    fibLinear = fib
  end function fibLinear

  integer function fibFormula(n)
    implicit none
    integer :: n

    fibFormula = nint(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5)
  end function fibFormula

  recursive function fibTailAuxiliary(n, prevFib, fib) result(r)
    implicit none
    integer :: n, prevFib, fib, r

    if (n == 0) then
      r = prevFib
    else
      r = fibTailAuxiliary(n - 1, fib, prevFib + fib)
    endif
  end function fibTailAuxiliary

  integer function fibTailRecursive(n)
    implicit none
    integer :: n

    fibTailRecursive = fibTailAuxiliary(n, 0, 1)
  end function fibTailRecursive

end program Fibonacci
