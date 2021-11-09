let rec fib n =
  if n < 2 then
    n
  else
    fib (n - 1) + fib (n - 2);;

let rec fibFormula n =
  int_of_float (Float.round ((((5.0 ** 0.5 +. 1.0) /. 2.0) ** float_of_int n) /. (5.0 ** 0.5)))

let rec fibTailRecursive ?(prevFib = 0) ?(fib = 1) n =
  match n with
    | 0 -> prevFib
    | _ -> fibTailRecursive ~prevFib:fib ~fib:(prevFib + fib) (n - 1)

let rec fibFormal n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | _ -> fibFormal (n - 1) + fibFormal (n - 2);;

let input =
  if (Array.length Sys.argv) > 1 then
    int_of_string Sys.argv.(1)
  else
    29;;
Printf.printf "%d\n" (fibTailRecursive input);;
