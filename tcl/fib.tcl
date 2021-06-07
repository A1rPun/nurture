proc fib {n} {
  if {$n < 2} {
    expr {$n}
  } else {
    expr {[fib [expr {$n - 1}]] + [fib [expr {$n - 2}]]}
  }
}

proc fib-linear n {
  if {$n < 2} {
    return $n
  }
  set prevfib 0
  set fib 1
  for {set i $n} {$i > 1} {incr i -1} {
    lassign [list $fib [incr fib $prevfib]] prevfib fib
  }
  return $fib
}

proc fib-formula n {
  expr {round(((5 ** .5 + 1) / 2) ** $n / 5 ** .5)}
}

proc fib-tail-recursive n {
  proc fib-tail-auxiliary {n prevfib fib} {
    if {$n == 0} {
      expr {$prevfib}
    } else {
      tailcall fib-tail-auxiliary [expr {$n - 1}] $fib [expr {$prevfib + $fib}]
    }
  }
  return [fib-tail-auxiliary $n 0 1]
}

set input 29
if {$argc > 0} {
  set input [lindex $argv 0]
}
puts "Fibonacci $input: [fib-tail-recursive $input]"
