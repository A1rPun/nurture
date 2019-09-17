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

// TODO: let rec fibFormula n:

let rec fibTailRecursive n: bigint =
  let rec fibTailIter n prevFib fib =
    match n with
    | 0 -> prevFib
    | _ -> (fibTailIter (n - 1) fib (prevFib + fib))
  fibTailIter n 0I 1I

// An explicit definition of the recursive nature from Fibonacci
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
    printfn "%A" (fibTailRecursive input)
    // printfn "%A" (fibUnfold |> Seq.item input)
    0
