: fib ( n -- fib )
  dup 1 > if 1 - dup 1 - recurse swap recurse + then
;

: fib_linear ( n -- fib )
  0 1 rot 1 - 0 do dup rot + loop nip
;

: fib_formula ( n -- fib )
  s>f 5e fsqrt fdup 1e f+ f2/ frot f** fswap f/ fround f>s
;

: fib_tail_auxiliary ( n prev_fib fib -- prev_fib fib n )
  rot dup 0 > if 1 - rot rot dup rot + recurse then
;
: fib_tail_recursive ( n -- fib )
  0 1 fib_tail_auxiliary drop drop
;

: fib_print ( n -- )
  ." Fibonacci " dup . ." : " fib_linear . cr
;

29 fib_print
