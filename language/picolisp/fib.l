#!/usr/bin/picolisp /usr/lib/picolisp/lib.l

(de fib (n)
  (cache '(NIL) n
    (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2))) ) ) )

(de fib-linear (n)
  (let (prev-fib 0 fib 1)
    (do n
      (prog1 fib (setq fib (+ prev-fib fib) prev-fib @)) ) ) )

(de fib-tail-auxiliary (n prev-fib fib)
  (if (= n 0)
    prev-fib
    (fib-tail-auxiliary (- n 1) fib (+ prev-fib fib)) ) )

(de fib-tail-recursive (n)
  (fib-tail-auxiliary n 0 1) )

# (de fib-formula (n) ) # Hard without proper floating point arithmetic

(de fib-formal (n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (T (+ (fib-formal (- n 1)) (fib-formal (- n 2)))) ) )

(argv input)
(setq input (if (not input) 29 (format input)))
(prinl (fib-linear input))
(bye)
