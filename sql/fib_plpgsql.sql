CREATE OR REPLACE FUNCTION fib(n INTEGER) RETURNS INTEGER AS $$
BEGIN
  IF (n < 2) THEN
    RETURN n;
  END IF;
  RETURN fib(n - 1) + fib(n - 2);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fibLinear(n INTEGER) RETURNS INTEGER AS $$
DECLARE
  prevFib INTEGER := 0;
  fib INTEGER := 1;
BEGIN
  IF (n < 2) THEN
    RETURN n;
  END IF;

  WHILE n > 1 LOOP
    SELECT fib, prevFib + fib INTO prevFib, fib;
    n := n - 1;
  END LOOP;

  RETURN fib;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fibFormula(n INTEGER) RETURNS INTEGER AS $$
BEGIN
  RETURN round(pow((pow(5, .5) + 1) / 2, n) / pow(5, .5));
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fibTailIter(prevFib INTEGER, fib INTEGER, n INTEGER) RETURNS INTEGER AS $$
BEGIN
  IF (n = 0) THEN
    RETURN prevFib;
  END IF;
  RETURN fibTailIter(fib, prevFib + fib, n - 1);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fibTailRecursion(n INTEGER) RETURNS INTEGER AS $$
BEGIN
  RETURN fibTailIter(0, 1, n);
END;
$$ LANGUAGE plpgsql;

SELECT fibLinear(29);
