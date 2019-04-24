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

args = commandArgs(trailingOnly=TRUE)
input = if (length(args) > 0) as.numeric(args[1]) else 29
print(fibLinear(input))
