function fib(n: number): number {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

function fibLinear(n: number, prevFib: number = 0, fib: number = 1): number {
  if (n < 2) return n;
  while (--n) [prevFib, fib] = [fib, prevFib + fib];
  return fib;
}

function fibFormula(n: number): number {
  return Math.round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5);
}

function fibTailRecursive(n: number, prevFib: number = 0, fib: number = 1): number {
  return n === 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib);
}

const input: number = typeof process !== "undefined" && (parseInt(process.argv[2], 10) || 29);
console.log(`Fibonacci ${input}: ${fibLinear(input)}`);
