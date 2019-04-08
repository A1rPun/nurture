const phi = (5 ** 0.5 + 1) / 2;
function fib(n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

function fibLinear(num) {
  if (num < 2) return num;
  let previousFib = 0;
  let fib = 1;
  while (--num) [previousFib, fib] = [fib, previousFib + fib];
  return fib;
}

function fibFormula(n) {
  return Math.round(phi ** n / 5 ** 0.5);
}

const input = (typeof process !== 'undefined' && process.argv[2]) || 29;
console.log(fibLinear(input));

function fibLinear2(num) {
  if (num < 2) return num;
  num--;
  let n = 1;
  while (--num) {
    n = Math.round(n * phi);
  }
  return n;
}
