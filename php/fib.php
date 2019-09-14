<?php
function fib($n) {
  return $n < 2 ? $n : fib($n-1) + fib($n-2);
}

function fibLinear($n) {
  if ($n < 2) return $n;
  $prevFib = 0;
  $fib = 1;
  while (--$n) list($prevFib, $fib) = array($fib, $fib + $prevFib);
  return $fib;
}

function fibFormula($n) {
  return round(((5 ** .5 + 1) / 2) ** $n / 5 ** .5);
}

function fibTail($n) {
  function fibTailIter($prevFib, $fib, $n) {
    return $n === 0 ? $prevFib : fibTailIter($fib, $prevFib + $fib, $n - 1);
  }
  return fibTailIter(0, 1, $n);
}

$input = count($argv) > 1 ? $argv[1] : 29;
echo(fibLinear($input).PHP_EOL);
