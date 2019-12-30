"TODO: Read input from stdin"
"TODO: Create method"
n := 29.
prevFib := 0.
fib := 1.
(n - 1) timesRepeat: [fib := prevFib + (prevFib := fib)].
Transcript show: (fib asString); cr.

" ^self <= 2
    ifTrue: [1]
    ifFalse: [(self - 1) fibonacci + (self - 2) fibonacci] "
