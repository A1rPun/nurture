-module(fib).
-export([recursive/1])
-export([tail/1])

recursive(N) when N < 2 -> N;
recursive(N) -> recursive(N - 1) + recursive(N - 2).

tail(N) -> iter(N, 0, 1).
iter(0, Result, Next) -> Result;
iter(N, Result, Next) when N > 0 -> iter(N - 1, Next, Result + Next).
