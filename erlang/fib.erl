-module(fib).
-export([recursive/1]).
-export([tail_recursive/1]).

recursive(N) when N < 2 -> N;
recursive(N) -> recursive(N - 1) + recursive(N - 2).

tail_recursive(N) -> tail_recursive(N, 0, 1).
tail_recursive(0, PrevFib, _) -> PrevFib;
tail_recursive(N, PrevFib, Fib) -> tail_recursive(N - 1, Fib, PrevFib + Fib).
