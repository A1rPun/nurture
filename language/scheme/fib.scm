(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

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

(define (fib-formula n)
  (round (/ (expt (/ (+ (expt 5 .5) 1) 2) n) (expt 5 .5))))

(define (fib-tail-recursive x)
  (define (fib-tail-auxiliary x a b)
    (if (zero? x)
        a
        (fib-tail-auxiliary (- x 1) b (+ a b))))
  (fib-tail-auxiliary x 0 1))

(define (fib-formal n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    ((+ (fib-formal (- n 1)) (fib-formal (- n 2))))))

(begin
  (define input 29)
  (display (format #f "Fibonacci ~a: ~a" input (fib-tail-recursive input))) (newline))
