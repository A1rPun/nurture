const input = (typeof process !== "undefined" && process.argv[2]) || 29;
console.log(fibLinear(input));
console.log(fibLinearBig(BigInt(input))); // https://github.com/tc39/proposal-bigint

function fib(n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

function fibLinear(n, prevFib = 0, fib = 1) {
  if (n < 2) return n;
  while (--n) [prevFib, fib] = [fib, prevFib + fib];
  return fib;
}

function fibFormula(n) {
  return Math.round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5);
}

function fibTailRecursion(n) {
  return fibTailIter(0, 1, n);
}
function fibTailIter(prevFib, fib, n) {
  return n < 1 ? prevFib : n === 1 ? fib : fibTailIter(fib, prevFib + fib, n - 1);
}

function* fibLinearGenerator(prevFib = 0, fib = 1) {
  yield prevFib;
  yield fib;
  while (true) {
    [prevFib, fib] = [fib, prevFib + fib];
    yield fib;
  }
}
function fibGenerator(n) {
  for (let x of fibLinearGenerator()) if (--n < 0) return x;
}

function fibLinearBig(n, prevFib = 0n, fib = 1n) {
  if (n < 2) return n;
  while (--n) [prevFib, fib] = [fib, prevFib + fib];
  return fib;
}
