fib <- function(n) {
  if (n < 2) n else Recall(n - 1) + Recall(n - 2)
}

fibLinear <- function(n) {
  fibs <- c(0, 1)
  while (n > 0) {
    temp <- fibs[2]
    fibs[2] <- sum(fibs)
    fibs[1] <- temp
    n <- n - 1
  }
  fibs[1]
}

fibFormula <- function(n) {
  round(((5 ^ 0.5 + 1) / 2) ^ n / 5 ^ 0.5)
}

fibTailRecursive <- function(n, prevFib = 0, fib = 1) {
  if (n == 0) prevFib else Recall(n - 1, fib, prevFib + fib)
}

fibFastDoubling <- function(n) {
  fibFastAuxiliary <- function(n) {
    if (n == 0) return(list(0, 1))

    fibs <- Recall(floor(n / 2))
    prevFib <- fibs[[1]]
    fib <- fibs[[2]]
    a <- prevFib * (fib * 2 - prevFib)
    b <- prevFib * prevFib + fib * fib
    if (n %% 2 == 0) list(a, b) else list(b, a + b)
  }
  fibFastAuxiliary(n)[[1]];
}

args = commandArgs(trailingOnly=TRUE)
input = if (length(args) > 0) as.numeric(args[1]) else 29
print(fibFastDoubling(input))
