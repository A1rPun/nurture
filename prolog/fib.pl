:- module(fib, [fib/2]).
:- initialization main, halt.

fib(0, 0).
fib(1, 1).
fib(n, f) :-
  succ(n1, n),
  succ(n2, n1),
  fib(n1, f1),
  fib(n2, f2),
  plus(f1, f2, f).

main :-
  writeln("test").

