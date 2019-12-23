function fib(n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

function fibLinear(n, prevFib = 0, fib = 1) {
  if (n < 2) return n;
  while (--n) [prevFib, fib] = [fib, prevFib + fib];
  return fib;
}

function fibFormula(n) {
  return Math.round(((5 ** .5 + 1) / 2) ** n / 5 ** .5);
}

function fibTailRecursive(n, prevFib = 0, fib = 1) {
  return n === 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib);
}

function fibMemoization(n) {
  if (!fibMemoization.cache) fibMemoization.cache = new Map([[0, 0], [1, 1]]);
  const getFib = n =>
    fibMemoization.cache.has(n)
      ? fibMemoization.cache.get(n)
      : getFib(n - 1) + getFib(n - 2);
  return getFib(n);
}

function fibGenerator(n) {
  function* generator(prevFib = 0, fib = 1) {
    yield prevFib;
    while (true) {
      yield fib;
      [prevFib, fib] = [fib, prevFib + fib];
    }
  }
  for (let x of generator()) if (--n < 0) return x;
}

function fibLinearBig(n, prevFib = 0n, fib = 1n) {
  if (n < 2) return n;
  while (--n) [prevFib, fib] = [fib, prevFib + fib];
  return fib;
}

// An explicit definition of the recursive nature
function fibFormal(n) {
  switch (n) {
    case 0:
      return 0;
    case 1:
      return 1;
    default:
      return fibFormal(n - 1) + fibFormal(n - 2);
  }
}

const input = (typeof process !== 'undefined' && process.argv[2]) || 29;
console.log(`Fibonacci ${input}: ${fibLinear(input)}`);
console.log(`Fibonacci ${input} BigInt: ${fibLinearBig(BigInt(input))}`); // https://github.com/tc39/proposal-bigint

// Minified tail recursive
// f=(a,b=0,c=1)=>a?f(a-1,c,b+c):b
