let rec fib n: bigint = if n < 2 then (bigint n) else fib(n - 1) + fib(n - 2)

let fibLinear n: bigint =
  let mutable i = n
  if i < 2 then (bigint i) else
    let mutable prevFib = 0I
    let mutable fib = 1I
    while i > 1 do
      let temp = prevFib + fib
      prevFib <- fib
      fib <- temp
      i <- i - 1
    fib

let rec fibFormula n: bigint =
  System.Math.Round(((5.0 ** 0.5 + 1.0) / 2.0) ** (n |> float) / 5.0 ** 0.5) |> bigint

let rec fibTailRecursive n: bigint =
  let rec fibTailAuxiliary n prevFib fib =
    match n with
    | 0 -> prevFib
    | _ -> (fibTailAuxiliary (n - 1) fib (prevFib + fib))
  fibTailAuxiliary n 0I 1I

let rec fibFormal n: bigint =
  match n with
  | 0 -> 0I
  | 1 -> 1I
  | _ -> fibFormal(n - 1) + fibFormal(n - 2)

let fibUnfold = Seq.unfold (fun (prevFib, fib) -> Some(prevFib, (fib, prevFib + fib))) (0I,1I)

let rec fibGenerator prevFib fib = seq {
  yield prevFib
  yield! fibGenerator fib (prevFib + fib)
}

[<EntryPoint>]
let main(args) =
    let input = if args.Length > 0 then args.[0] |> int else 29
    printfn "%A" (fibLinear input)
    // printfn "%A" (fibUnfold |> Seq.item input)
    0
