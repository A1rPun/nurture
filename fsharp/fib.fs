let rec fib n: bigint = if n < 2 then (bigint n) else fib(n - 1) + fib(n - 2)
let fibUnfold = Seq.unfold (fun (prevFib, fib) -> Some(prevFib, (fib, prevFib + fib))) (0I,1I)

let rec fibPattern n: bigint =
  match n with
  | 0 -> 0I
  | 1 -> 1I
  | _ -> fibPattern(n - 1) + fibPattern(n - 2)

let rec fibTailRecursion n: bigint =
  let rec fibTailIter prevFib fib n =
    match n with
    | 0 -> prevFib
    | 1 -> fib
    | n -> (fibTailIter fib (prevFib + fib) (n - 1))
  fibTailIter 0I 1I n

let rec fibGenerator prevFib fib = seq {
  yield prevFib
  yield! fibGenerator fib (prevFib + fib)
}

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

[<EntryPoint>]
let main(args) =
    let input = if args.Length > 0 then args.[0] |> int else 29
    printfn "%A" (fibTailRecursion input)
    // printfn "%A" (fibUnfold |> Seq.item input)
    0