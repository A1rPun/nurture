-module(fib).
-export([recursive/1])
-export([linear/1])

recursive(N) when N < 2 -> N;
recursive(N) -> recursive(N-1) + recursive(N-2).

linear(N) -> iter(N, 0, 1).
iter(0, Result, Next) -> Result;
iter(Iter, Result, Next) -> when Iter > 0 -> iter(Iter - 1, Next, Result + Next).
