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
        [$prevFib, $fib] = [$fib, $fib + $prevFib];
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

function fibFastDoubling($n)
{
    function fibFastAuxiliary($n)
    {
        if ($n == 0) {
            return [0, 1];
        }
        [$prevFib, $fib] = fibFastAuxiliary(floor($n / 2));
        $a = $prevFib * ($fib * 2 - $prevFib);
        $b = $prevFib * $prevFib + $fib * $fib;
        return $n % 2 == 0 ? [$a, $b] : [$b, $a + $b];
    }
    return fibFastAuxiliary($n)[0];
}

function fibGenerator($n, $prevFib = 0, $fib = 1)
{
    while ($n-- >= 0) {
        yield $prevFib;
        [$prevFib, $fib] = [$fib, $fib + $prevFib];
    }
}
function fibGenerate($n)
{
    foreach (fibGenerator($n) as $fib) echo $fib.PHP_EOL;
}

$input = count($argv) > 1 ? $argv[1] : 29;
printf("Fibonacci %d: %d".PHP_EOL, $input, fibFastDoubling($input));
