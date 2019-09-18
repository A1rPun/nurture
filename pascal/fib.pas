program Fibonacci;

// Compiler mode objfpc
// This is the same mode as FPC mode, but it also includes classes, interfaces and exceptions.
// In this case used for optional parameters, the rest of de code is FPC compliant.
{$mode objfpc}

uses math, sysutils;

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

var input: Int64;
begin
  if ParamCount > 0
  then input := StrToInt(ParamStr(1))
  else input := 29;
  WriteLn(IntToStr(fibLinear(input)));
end.
