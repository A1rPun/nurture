<?php
function fib($n) {
    return $n < 2 ? $n : fib($n-1) + fib($n-2);
}

function fibLinear($n) {
    if ($n < 2) return $n;
    $previousFib = 0;
    $fib = 1;
    while (--$n) list($previousFib, $fib) = array($fib, $fib + $previousFib);
    return $fib;
}

function fibFormula($n) {
    return round(((5 ** .5 + 1) / 2) ** $n / 5 ** .5);
}

$input = count($argv) > 1 ? $argv[1] : 29;
echo(fibLinear($input)."\n");
echo(fibFormula($input)."\n");
?>
