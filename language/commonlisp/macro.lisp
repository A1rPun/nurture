;;; Example
;; Macro
(defmacro println (&body body)
 `(dolist (x ',body)
    (format t "~a~%" (eval x))))
;; Usage
(println 29 (+ 40 2) (- 30 1))
;; Expands to (C-c, M-e)
(DOLIST (X '(29 (+ 40 2) (- 30 1))) (FORMAT T "~a~%" (EVAL X)))
;; Output
; 29
; 42
; 29

;; (sb-cltl2:macroexpand-all '(fib-macro 5))
;; (swank-backend:macroexpand-all '(fib-macro 5))
(defmacro fib-macro (n &optional (prev-fib 0) (fib 1))
  (if (= 0 n) prev-fib
    (let ((m (1- n)) (temp (+ prev-fib fib)))
      `(+ ,prev-fib (fib-macro ,m ,fib ,temp)))))

(fib-macro 5)
