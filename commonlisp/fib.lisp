(defun fib (n)
  (if (< n 2)
    n
    (+ (fib (- n 2)) (fib (- n 1)))))

(defun fib-linear (n)
  (loop repeat n
    for prevFib = 0 then fib
    and fib = 1 then (+ prevFib fib)
    finally (return fib)))

(defun fib-tail-recursive (n &optional (prevFib 0) (fib 1))
  (if (= n 0)
    prevFib
    (fib-tail-recursive (- n 1) fib (+ prevFib fib))))

(defun fib-formula (n)
  (round (/ (expt (/ (+ (expt 5 .5) 1) 2) n) (expt 5 .5))))

(handler-case
  (let ((nthfib (parse-integer (cadr sb-ext:*posix-argv*))))
    (time (format t "Fib number ~a: ~a~%~%" nthfib (fib-tail-recursive nthfib))))
  (error (c)
    (format t "Please enter a natural number or 0.~%")
    (values 0 c)))
