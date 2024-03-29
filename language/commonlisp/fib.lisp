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
  (if (zerop n)
    prev-fib
    (fib-tail-recursive (- n 1) fib (+ prev-fib fib))))

(defun fib-formula (n)
  (round (/ (expt (/ (+ (expt 5 .5d0) 1) 2) n) (expt 5 .5d0))))

;; depends on package infix-math - contributed by @bklaase
;; (defun fib-formula-infix (n)
;;   (let* ((sq5 (sqrt 5))
;;          (phi ($ (1+ sq5) / 2d0)))
;;     (round ($ phi ^ n / sq5))))

(defun fib-formal (n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t (+ (fib-formal (- n 1)) (fib-formal (- n 2))))))

(defun fib-list (n &optional (acc '(1 0)))
  (if (< n 2)
      (reverse acc)
      (fib-list (1- n) (cons (reduce #'+ (subseq acc 0 2)) acc))))

;; with help from @bklaase
(defun fib-fast-doubling (n)
  (if (zerop n)
  (values 0 1)
  (multiple-value-bind (prevFib fib)
      (fib-fast-doubling (floor (/ n 2)))
    (let ((a (* prevFib (- (* fib 2) prevFib)))
          (b (+ (* prevFib prevFib) (* fib fib))))
        (if (zerop (mod n 2))
          (values a b)
          (values b (+ a b)))))))

(handler-case
  (let ((nthfib (parse-integer (cadr sb-ext:*posix-argv*))))
    (format t "Fibonacci ~a: ~a~%" nthfib (fib-fast-doubling nthfib)))
  (error (c)
    (format t "Please enter a number.~%~a~%" c)))
