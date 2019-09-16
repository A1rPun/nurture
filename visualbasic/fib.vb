imports System.Math
' Imports BigInteger = System.Numerics.BigInteger

module Fibonacci
  function Fib(ByVal n as Integer) as Decimal
    if n < 2 then return n
    return Fib(n - 1) + Fib(n - 2)
  end function

  function FibFormula(ByVal n as Integer) as Decimal
    return Math.Round(Math.Pow((Math.Pow(5, .5) + 1) / 2, n) / Math.Pow(5, .5))
  end function

  ' Want to use BigInteger here
  function FibLinear(ByVal n as Integer) as Integer
    if n < 2 then return n
    dim prevFib as Integer = 0
    dim fib as Integer = 1
    while n > 1
      dim temp as Integer = fib
      fib = prevFib + fib
      prevFib = temp
      n -= 1
    end while
    return fib
  end function

  function FibTailRecursive(
      ByVal n as Integer,
      Optional ByVal prevFib as Integer = 0,
      Optional ByVal fib as Integer = 1
    )
    if n = 0 then return prevFib
    return FibTailRecursive(n - 1, fib, prevFib + fib)
  end function

  sub Main(ByVal cmdArgs() As String)
    dim input as Integer
    if cmdArgs.Length > 0 then
      input = cmdArgs(0)
    else
      input = 29
    end if
    Console.WriteLine(FibLinear(input))
  end sub
end module
