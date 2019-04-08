# Assembly

```
$ as {program}.s -o {program}.o
$ ld {program}.o -o {program} -e {function}
$ ./{program}
```

> `ld` Default link is `_start`

## Syntax

Instruction | Meaning
--- | ---
`movq %rax, %rbx` | `rbx = rax`
`movq $123, %rax` | `rax = 123`
`movq %rsi, -16(%rbp)` | `mem[rbp-16] = rsi`
`subq $10, %rbp` | `rbp -= 10`
`cmpl %eax %ebx` | compare then set flags. If eax == ebx, zero flag is set.
`jmp <location>` | unconditional jump
`je <location>` | jump to `<location>` if equal flag is set
`jg,jge,jl,jle,jne,...` | `>`, `>=`, `<`, `<=`, `!=`, ...
`movl, movq, ...` | long (32bit), quadword (64bit), ...
