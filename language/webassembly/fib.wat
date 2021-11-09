(module
  (export "fib" (func $fibLinear))
  (func $fib (param $n i32) (result i32)
    (if (i32.lt_s (get_local $n)(i32.const 2))
      (return (get_local $n))
    )
    (return (i32.add
      (call $fib (i32.sub (get_local $n)(i32.const 2)))
      (call $fib (i32.sub (get_local $n)(i32.const 1)))
     )
    )
  )
  (func $fibLinear (param $n i32) (result i32)
    (local $i i32)
    (local $prevfib i32)
    (local $fib i32)

    (if (i32.lt_s (get_local $n) (i32.const 2))
      (return (get_local $n))
    )

    (set_local $i (i32.const 1))
    (set_local $prevfib (i32.const 0))
    (set_local $fib (i32.const 1))

    (block
      (loop
        local.get $prevfib
        local.get $fib
        i32.add
        (set_local $prevfib (get_local $fib))
        set_local $fib

        (set_local $i
          (i32.add
            (get_local $i)
            (i32.const 1)
          )
        )

        (br_if 1 (i32.ge_u (get_local $i) (get_local $n)))
        (br 0)
      )
    )

    get_local $fib
  )
)

