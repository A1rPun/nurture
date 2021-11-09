defmodule Fibonacci do
  import :math, only: [pow: 2]

  def recursive(n) when n < 2, do: n
  def recursive(n), do: recursive(n - 1) + recursive(n - 2)

  def formula(n), do: round(pow((pow(5, 0.5) + 1) / 2, n) / pow(5, 0.5))

  def tail_recursive(n), do: tail_recursive(n, 0, 1)
  def tail_recursive(0, prevFib, _), do: prevFib
  def tail_recursive(n, prevFib, fib), do: tail_recursive(n - 1, fib, prevFib + fib)

  def formal(0), do: 0
  def formal(1), do: 1
  def formal(n), do: formal(n - 1) + formal(n - 2)
end
