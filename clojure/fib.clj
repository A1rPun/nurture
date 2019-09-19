(ns fib)

(defn fib [n]
  (if (< n 2)
    n
    (+ (fib (- n 2)) (fib (- n 1)))))

(defn fib-formula [n]
  (Math/round (/ (Math/pow (/ (+ (Math/pow 5 0.5) 1) 2) n) (Math/pow 5 0.5))))

(defn fib-tail-recursive
  ([n] (fib-tail-recursive n 0 1))
  ([n prev-fib fib] (if (= n 0)
    prev-fib
    (fib-tail-recursive (- n 1) fib (+ prev-fib fib)))))

(defn fib-formal [n]
  "An explicit definition of the recursive nature"
  (cond
    (= n 0) 0
    (= n 1) 1
    :else (+ (fib-formal (- n 1)) (fib-formal (- n 2)))))

(doseq
  [x (if (= 0 (count *command-line-args*))
    [29]
    (map #(Integer/parseInt %) *command-line-args*))]
  (printf "Fibonacci %s: %s\n" x (fib-tail-recursive x)))

; (fn fib-linear-do (n)
;   (do ((prev-fib 0 fib)
;        (fib 1 (+ prev-fib fib))
;        (n n (1- n)))
;       ((zerop n) prev-fib)))
