(ns fib)

(defn fib [n]
  (if (< n 2)
    n
    (+ (fib (- n 2)) (fib (- n 1)))))

(defn fib-formula [n]
  (Math/round (/ (Math/pow (/ (+ (Math/pow 5 0.5) 1) 2) n) (Math/pow 5 0.5))))

(defn fib-tail-recursive
  ([n] (fib-tail-recursive n 0 1))
  ([n prev-fib fib] (if (zero? 0)
    prev-fib
    (fib-tail-recursive (- n 1) fib (+ prev-fib fib)))))

(defn fib-formal [n]
  (cond
    (= n 0) 0
    (= n 1) 1
    :else (+ (fib-formal (- n 1)) (fib-formal (- n 2)))))

(defn fib-fast-doubling [n]
  (letfn [(fib-fast-auxiliary* [n]
    (if (zero? n)
      [0 1]
      (let [[prevFib fib] (fib-fast-auxiliary* (quot n 2))
            a (*' prevFib (-' (*' 2 fib) prevFib))
            b (+' (*' fib fib) (*' prevFib prevFib))]
        (if (even? n)
          [a b]
          [b (+' a b)]))))]
    (first (fib-fast-auxiliary* n))))

(defn fib-linear-loop [n]
  (loop [prev-fib 0
         fib 1
         n n]
    (if (zero? n)
      prev-fib
      (recur fib (+ prev-fib fib) (dec n)))))

(doseq
  [x (if (zero? (count *command-line-args*))
    [29]
    (map #(Integer/parseInt %) *command-line-args*))]
  (printf "Fibonacci %s: %s\n" x (fib-fast-doubling x)))
