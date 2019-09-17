(defun fib (n)
  (if (< n 2)
    n
    (+ (fib (- n 2)) (fib (- n 1)))))

(defun fib-linear-loop (n)
  (loop :repeat n
    :for prevFib = 0 :then fib
    :and fib = 1 :then (+ prevFib fib)
    :finally (return fib)))

(defun fib-linear-do (n)
  (do ((prevFib 0 fib)
       (fib 1 (+ prevFib fib))
       (n n (1- n)))
      ((zerop n) prevFib)))

(defun fib-tail-recursive (n &optional (prevFib 0) (fib 1))
  (if (= n 0)
    prevFib
    (fib-tail-recursive (- n 1) fib (+ prevFib fib))))

(defun fib-formula (n)
  (round (/ (expt (/ (+ (expt 5 .5d0) 1) 2) n) (expt 5 .5d0))))

(defun fib-formal (n)
An explicit definition of the recursive nature
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t (+ (fib-formal (- n 1)) (fib-formal (- n 2))))))

;; (defun fib-linear-loop-do (n &optional (prevFib 0) (fib 1))
;;   (loop :repeat n
;;      :do (+ prevFib fib)
;;      :finally (return prevFib)))

(handler-case
  (let ((nthfib (parse-integer (cadr sb-ext:*posix-argv*))))
    (time (format t "Fib number ~a: ~a~%~%" nthfib (fib-tail-recursive nthfib))))
  (error (c)
    (format t "Please enter a natural number or 0.~%")
    (values 0 c)))
