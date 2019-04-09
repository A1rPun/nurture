const input = (typeof process !== "undefined" && process.argv[2]) || 29;
console.log(fibLinear(input));

function fib(n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

function fibLinear(n) {
  if (n < 2) return n;
  let prevFib = 0, fib = 1;
  while (--n) [prevFib, fib] = [fib, prevFib + fib];
  return fib;
}

function fibFormula(n) {
  return Math.round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5);
}

function fibTail(n) {
  return fibTailIter(0, 1, n);
}
function fibTailIter(prevFib, fib, n) {
  return n < 1 ? prevFib : n === 1 ? fib : fibTailIter(fib, prevFib + fib, n - 1);
}
