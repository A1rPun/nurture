-module(fib).
-export([recursive/1]).
-export([tail_recursive/1]).
-export([formal/1]).

recursive(N) when N < 2 -> N;
recursive(N) -> recursive(N - 1) + recursive(N - 2).

tail_recursive(N) -> tail_recursive(N, 0, 1).
tail_recursive(0, PrevFib, _) -> PrevFib;
tail_recursive(N, PrevFib, Fib) -> tail_recursive(N - 1, Fib, PrevFib + Fib).

% An explicit definition of the recursive nature from Fibonacci
formal(0) -> 0;
formal(1) -> 1;
formal(N) -> formal(N - 1) + formal(N - 2).
