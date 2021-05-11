(defun fib (n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(defun fib-linear-loop (n)
  (loop :repeat n
    :for prev-fib = 0 :then fib
    :and fib = 1 :then (+ prev-fib fib)
    :finally (return fib)))

(defun fib-linear-do (n)
  (do ((prev-fib 0 fib)
       (fib 1 (+ prev-fib fib))
       (n n (1- n)))
      ((zerop n) prev-fib)))

(defun fib-tail-recursive (n &optional (prev-fib 0) (fib 1))
  (if (= n 0)
    prev-fib
    (fib-tail-recursive (- n 1) fib (+ prev-fib fib))))

(defun fib-formula (n)
  (round (/ (expt (/ (+ (expt 5 .5d0) 1) 2) n) (expt 5 .5d0))))

;; depends on package infix-math - contributed by @bklaase
(defun fib-formula-infix (n)
  (let* ((sq5 (sqrt 5))
         (phi ($ (1+ sq5) / 2d0)))
    (round ($ phi ^ n / sq5))))

(defun fib-formal (n)
  "An explicit definition of the recursive nature"
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t (+ (fib-formal (- n 1)) (fib-formal (- n 2))))))

(defun fib-list (n &optional (acc '(1 0)))
  (if (< n 2)
      (reverse acc)
      (fib-list (1- n) (cons (reduce #'+ (subseq acc 0 2)) acc))))

(handler-case
  (let ((nthfib (parse-integer (cadr sb-ext:*posix-argv*))))
    (time (format t "Fib number ~a: ~a~%~%" nthfib (fib-tail-recursive nthfib))))
  (error (c)
    (format t "Please enter a natural number or 0.~%")
    (values 0 c)))
