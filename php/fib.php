<?php
function fib($n)
{
    return $n < 2 ? $n : fib($n-1) + fib($n-2);
}

function fibLinear($n, $prevFib = 0, $fib = 1)
{
    if ($n < 2) {
        return $n;
    }
    while (--$n) {
        list($prevFib, $fib) = array($fib, $fib + $prevFib);
    }
    return $fib;
}

function fibFormula($n)
{
    return round(((5 ** .5 + 1) / 2) ** $n / 5 ** .5);
}

function fibTailRecursive($n, $prevFib = 0, $fib = 1)
{
    return $n === 0 ? $prevFib : fibTailRecursive($n - 1, $fib, $prevFib + $fib);
}

// TODO: WIP
function fibGenerator($n, $prevFib = 0, $fib = 1)
{
    if ($n < 1) {
        yield $n;
        return;
    }
    yield $prevFib;
    while ($n--) {
        yield $fib;
        list($prevFib, $fib) = array($fib, $fib + $prevFib);
    }
}
// foreach (fibGenerator($input) as $fib) echo $fib.PHP_EOL;

$input = count($argv) > 1 ? $argv[1] : 29;
echo(fibLinear($input).PHP_EOL);
