"use strict";

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

function fibTailRecursive(n, prevFib = 0, fib = 1) {
  return n === 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib);
}

function fibFastAuxiliary(n) {
  if (n === 0n) return [0n, 1n];
  const [prevFib, fib] = fibFastAuxiliary((n / 2n) | 0n);
  const c = prevFib * (fib * 2n - prevFib);
  const d = prevFib * prevFib + fib * fib;
  return n % 2n === 0n ? [c, d] : [d, c + d];
}
function fibFastDoubling(n) {
  return fibFastAuxiliary(n)[0];
}

function fibLinearBig(n, prevFib = 0n, fib = 1n) {
  if (n < 2) return n;
  while (--n) [prevFib, fib] = [fib, prevFib + fib];
  return fib;
}

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

function* fibGenerator(n, prevFib = 0, fib = 1) {
  while (n-- >= 0) {
    yield prevFib;
    [prevFib, fib] = [fib, prevFib + fib];
  }
}
function fibGenerate(n) {
  for (const x of fibGenerator(n)) console.log(x);
}

const negativeFib = fn => n => n < 0n ? -fn(n * -1n) : fn(n);
const input = (typeof process !== "undefined" && process.argv[2]) || 29;
const result = negativeFib(fibFastDoubling)(BigInt(input));
console.log(`Fibonacci ${input}: ${result}`);
