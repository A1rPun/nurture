:- initialization main, halt.

recursive(N, X) :-
  N < 2, X is N;
  N1 is N - 1, N2 is N - 2,
  recursive(N1, Fib), recursive(N2, PrevFib),
  X is PrevFib + Fib.

formula(N, X) :-
  X is round(((5 ** 0.5 + 1) / 2) ** N / 5 ** 0.5).

tail_recursive(N, X) :- tail_recursive(N, X, 0, 1).
tail_recursive(0, X, PrevFib, _) :- X is PrevFib.
tail_recursive(N, X, PrevFib, Fib) :-
  N1 is N - 1, N2 is PrevFib + Fib,
  tail_recursive(N1, X, Fib, N2).

fast_doubling(N, X) :- fast_doubling(N, X, _).
fast_doubling(0, 0, 1).
fast_doubling(N, A, B) :-
  N1 is floor(N / 2),
  fast_doubling(N1, A1, B1),
  A2 is A1 * (B1 * 2 - A1),
  B2 is A1 * A1 + B1 * B1,
  N2 is N mod 2,
  fast_doubling(N2, A, B, A2, B2).
fast_doubling(0, A, B, A1, B1) :- A is A1, B is B1.
fast_doubling(_, A, B, A1, B1) :- A is B1, B is A1 + B1.

formal(0, 0).
formal(1, 1).
formal(N, X) :-
  succ(N1, N), succ(N2, N1),
  formal(N1, Fib), formal(N2, PrevFib),
  plus(PrevFib, Fib, X).

fib_print(N) :-
  write('Fibonacci '), write(N), write(': '),
  fast_doubling(N, X),
  write(X), nl.

main :-
  current_prolog_flag(argv, A), last(A, M),
  catch(atom_number(M, N), _, fail),
  fib_print(N); fib_print(29).

