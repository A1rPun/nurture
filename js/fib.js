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
  return Math.round(((5 ** 0.5 + 1) / 2) ** n / 5 ** 0.5);
}

const input = typeof process !== 'undefined' ? process.argv[2] : 29;
console.log(fibLinear(input));
console.log(fibFormula(input));

function fibLinear2(num) {
  if (!num) return 0;
  if (num === 1 || num === 2) return 1;

  num -= 1;
  var n = 1;
  while (--num) {
    n = Math.round(n * 1.61803398874989);
  }
  return n;
}
