#lang racket
(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(define (fibTailRecursive x)
  (define (fibTailAuxiliary x a b)
    (if (= x 0)
      a
      (fibTailAuxiliary (- x 1) b (+ a b))))
  (fibTailAuxiliary x 0 1))

(define (fib-linear-do n)
  (do ((num 2 (+ num 1))
        (prev-fib 1 fib)
        (fib 1 (+ fib prev-fib)))
      ((>= num n) fib)))

(define (fib-linear-loop n)
  (let loop ((a 0) (b 1) (n n))
    (if (= n 0)
      a
      (loop b (+ a b) (- n 1)))))

(define (fibFormula n)
  (round (/ (expt (/ (+ (expt 5 .5) 1) 2) n) (expt 5 .5))))

(define (fib-formal n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    ((+ (fib-formal (- n 1)) (fib-formal (- n 2))))))

(begin
  (define args (current-command-line-arguments))
  (define n (if (= 0 (vector-length args))
    29
    (string->number(vector-ref args 0))))
  (displayln (fib-formal n)))
