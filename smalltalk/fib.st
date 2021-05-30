Object subclass: Fibonacci [
  fib: n
  [
    ^n < 2
      ifTrue: [n]
      ifFalse: [(self fib: n - 1) + (self fib: n - 2)].
  ]
  fibLinear: n
  [
    | prevFib fib |
    prevFib := 0.
    fib := 1.
    (n - 1) timesRepeat: [fib := prevFib + (prevFib := fib)].
    ^fib.
  ]
  fibFormula: n
  [
    ^((((((5 raisedTo: 0.5) + 1) / 2) raisedTo: n) / (5 raisedTo: 0.5)) rounded).
  ]
  fibTailAuxiliary: n prev: prevFib next: fib
  [
    ^n == 0
      ifTrue: [prevFib]
      ifFalse: [(self fibTailAuxiliary: n - 1 prev: fib next: prevFib + fib)].
  ]
  fibTailRecursive: n
  [
    ^(self fibTailAuxiliary: n prev: 0 next: 1).
  ]
]

| input result |
input := Smalltalk getArgc > 1
  ifTrue: [(Smalltalk getArgv: 2) asNumber]
  ifFalse: [29].
result := (Fibonacci new) fibLinear: input.
Transcript show: result asString; cr.
