#lang racket
(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(define (fibTailRecursive x)
  (define (fibTailAuxiliary x a b)
    (if (zero? x)
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
    (if (zero? n)
      a
      (loop b (+ a b) (- n 1)))))

(define (fibFormula n)
  (round (/ (expt (/ (+ (expt 5 .5) 1) 2) n) (expt 5 .5))))

(define (fib-formal n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    ((+ (fib-formal (- n 1)) (fib-formal (- n 2))))))

(define (fib-fast-doubling n)
  (define (fib-fast-auxiliary n)
    (if (zero? n)
      (values 0 1)
      (let-values ([(prevFib fib) (fib-fast-auxiliary (floor (/ n 2)))])
        (let ([a (* prevFib (- (* fib 2) prevFib))]
              [b (+ (* prevFib prevFib) (* fib fib))])
          (if (zero? (remainder n 2))
            (values a b)
            (values b (+ a b)))))))
  (let-values ([(fib _) (fib-fast-auxiliary input)]) fib))

(begin
  (define args (current-command-line-arguments))
  (define input (if (zero? (vector-length args))
    29
    (string->number(vector-ref args 0))))
  (displayln (format "Fibonacci ~a: ~a" input (fib-fast-doubling input))))
