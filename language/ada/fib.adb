with
  Ada.Text_IO,
  Ada.Command_Line,
  Ada.Numerics.Elementary_Functions;
use
  Ada.Text_IO,
  Ada.Command_Line,
  Ada.Numerics.Elementary_Functions;

procedure Fib is
  function fib(n : integer) return integer is
  begin
    if n < 2 then
      return n;
    else
      return fib(n-1) + fib(n-2);
    end if;
  end fib;

  function fibLinear(n : integer) return integer is
    prevFib : integer := 0;
    fib : integer := 1;
    temp : integer;
    begin
      for i in 1..n loop
        temp := prevFib + fib;
        prevFib := fib;
        fib := temp;
      end loop;
    return prevFib;
  end fibLinear;

  function fibFormula(n : integer) return integer is
  begin
    return integer(((5.0 ** 0.5 + 1.0) / 2.0) ** float(n) / 5.0 ** 0.5);
  end fibFormula;

  function fibTailAuxiliary(n : integer; prevFib : integer; fib : integer) return integer is
  begin
    if n = 0 then
      return prevFib;
    else
      return fibTailAuxiliary(n - 1, fib, prevFib + fib);
    end if;
  end fibTailAuxiliary;

  function fibTailRecursive(n : integer) return integer is
  begin
    return fibTailAuxiliary(n, 0, 1);
  end fibTailRecursive;

  input: Integer;
begin
  if Argument_Count > 0 then
    input := Integer'Value(Argument(1));
  else
    input := 29;
  end if;
  Put_Line(Integer'Image(fibLinear(input)));
end Fib;
