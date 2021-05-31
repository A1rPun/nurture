program Fibonacci;

// Compiler mode objfpc
// This is the same mode as FPC mode, but it also includes classes, interfaces and exceptions.
// In this case used for optional parameters, the rest of de code is FPC compliant.
{$mode objfpc}

uses math, sysutils;

type
  Int64Array = array of Int64;

function fib(n: Int64): Int64;
begin
  if n < 2
  then fib := n
  else fib := fib(n - 1) + fib(n - 2);
end;

function fibLinear(n: Int64; prevFib: Int64 = 0; fib: Int64 = 1): Int64;
var
  temp: Int64;
begin
  while n > 1 do
  begin
    temp := prevFib + fib;
    prevFib := fib;
    fib := temp;
    dec(n);
  end;
  fibLinear := fib;
end;

function fibFormula(n: Int64): Int64;
begin
  fibFormula := round(power((power(5, 0.5) + 1) / 2, n) / power(5, 0.5));
end;

function fibTailRecursive(n: Int64; prevFib: Int64 = 0; fib: Int64 = 1): Int64;
begin
  if n = 0
  then fibTailRecursive := prevFib
  else fibTailRecursive := fibTailRecursive(n - 1, fib, prevFib + fib);
end;

function fibFastDoubling(n: Int64): Int64;
  function fibFastAuxiliary(n: Int64): Int64Array;
  var
    fibs: Int64Array;
    prevFib, fib, a, b: Int64;
  begin
    if n = 0
    then begin
      fibFastAuxiliary := [0, 1];
      exit;
    end;

    fibs := fibFastAuxiliary(floor(n / 2));
    prevFib := fibs[0];
    fib := fibs[1];
    a := prevFib * (fib * 2 - prevFib);
    b := prevFib * prevFib + fib * fib;

    if n mod 2 = 0
    then fibFastAuxiliary := [a, b]
    else fibFastAuxiliary := [b, a + b];
  end;
begin
  fibFastDoubling := fibFastAuxiliary(n)[0];
end;

var input: Int64;
begin
  if ParamCount > 0
  then input := StrToInt(ParamStr(1))
  else input := 29;
  WriteLn(IntToStr(fibFastDoubling(input)));
end.
