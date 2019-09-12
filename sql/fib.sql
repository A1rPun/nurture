-- https://gist.github.com/seisvelas/d60f5f2caf232dceede0326169014418
WITH RECURSIVE fib(fibonacci, nextFib, nth) AS (
    SELECT 0, 1, 0
  UNION ALL
    SELECT nextFib, fibonacci + nextFib, nth + 1
    FROM fib
    WHERE nth < 45 -- Integer out of range kluge
)
SELECT nth, fibonacci
FROM fib
WHERE nth = 29;
