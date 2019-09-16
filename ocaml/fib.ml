let rec fib n =
  if n < 2 then
    n
  else
    fib (n - 1) + fib (n - 2);;

let rec fibPattern n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | _ -> fibPattern (n - 1) + fibPattern (n - 2);;

let rec fibTailRecursive ?(prevFib = 0) ?(fib = 1) n =
  match n with
    | 0 -> prevFib
    | _ -> fibTailRecursive ~prevFib:fib ~fib:(prevFib + fib) (n - 1)

let input =
  if (Array.length Sys.argv) > 1 then
    int_of_string Sys.argv.(1)
  else
    29;;
Printf.printf "%d\n" (fibTailRecursive input);;

(* let fibTailRecursive nth =
  let rec fibTailIter n prevFib fib =
    match n with
    | 0 -> prevFib
    | _ -> fibTailIter (n - 1) fib (prevFib + fib)
  in fibTailIter nth 0 1;; *)
