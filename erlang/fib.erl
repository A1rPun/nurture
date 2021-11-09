-module(fib).
-import(math, [pow/2]).
-import(lists, [nth/2]).
-export([recursive/1]).
-export([formula/1]).
-export([tail_recursive/1]).
-export([fast_doubling/1]).
-export([formal/1]).

recursive(N) when N < 2 -> N;
recursive(N) -> recursive(N - 1) + recursive(N - 2).

formula(N) -> round(pow((pow(5, 0.5) + 1) / 2, N) / pow(5, 0.5)).

tail_recursive(N) -> tail_recursive(N, 0, 1).
tail_recursive(0, PrevFib, _) -> PrevFib;
tail_recursive(N, PrevFib, Fib) -> tail_recursive(N - 1, Fib, PrevFib + Fib).

fast_auxiliary(0) -> [0, 1];
fast_auxiliary(N) ->
  fibs = fast_auxiliary(N div 2),
  prevFib = nth(1, fibs),
  fib = nth(2, fibs),
  a = prevFib * (fib * 2 - prevFib),
  b = prevFib * prevFib + fib * fib,
  if
    n rem 2 == 0 -> [a, b];
    true -> [b, a + b]
  end.
fast_doubling(N) -> nth(1, fast_auxiliary(N)).

formal(0) -> 0;
formal(1) -> 1;
formal(N) -> formal(N - 1) + formal(N - 2).
