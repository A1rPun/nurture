: fib ( n -- fib )
  dup 1 > if
    1 - dup 1 - recurse swap recurse +
  then
;

: fib_linear ( n -- fib )
  0 1
  rot 1 - 0 do
    dup rot +
  loop
  nip
;

29 fib . CR
29 fib_linear . CR

\ bye
