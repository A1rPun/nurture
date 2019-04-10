program Fibonacci;
uses math, sysutils;
var input: Int64;

function fib(n: Int64): Int64;
begin
  if n < 2
  then fib := n
  else fib := fib(n-1) + fib(n-2);
end;

function fibLinear(n: Int64): Int64;
var
  fib, prevFib, temp: Int64;
begin
  prevFib := 0;
  fib := 1;
  while n > 1 do
  begin
    temp := fib;
    fib := prevFib + fib;
    prevFib := temp;
    dec(n);
  end;
  fibLinear := fib;
end;

function fibFormula(n: Int64): Int64;
begin
  fibFormula := round(power((power(5, 0.5) + 1) / 2, n) / power(5, 0.5));
end;

begin
  if ParamCount > 0
  then input := StrToInt(ParamStr(1))
  else input := 29;
  WriteLn(IntToStr(fibLinear(input)));
end.
