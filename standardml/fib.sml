fun fib n = if n < 2 then n else fib (n - 1) + fib (n - 2)

fun fibLinear n =
  if n < 2 then n else
    let val i = ref n
        val prevFib = ref 0
        val fib = ref 1
        val temp = ref 0
    in while !i > 1 do
      (i := (!i - 1);
      temp := (!prevFib + !fib);
      prevFib := !fib;
      fib := !temp);
      !fib
    end

(* fibFormula is hard without native exponent  *)

fun fibTailRecursive n =
  let fun fibTailAuxiliary 0 prevFib _ = prevFib
        | fibTailAuxiliary n prevFib fib = fibTailAuxiliary (n - 1) fib (prevFib + fib)
  in fibTailAuxiliary n 0 1
  end

fun fibFormal 0 = 0
  | fibFormal 1 = 1
  | fibFormal n = fibFormal (n - 1) + fibFormal (n - 2)

val args = CommandLine.arguments ();
val input = if (List.length args) > 0 then (valOf (Int.fromString (List.hd args))) else 29;
print ((Int.toString (fibLinear input)) ^ "\n");
