# Nurture

> [Yet another programming chrestomathy](http://www.rosettacode.org)

Every language directory contains:

- README with a quick how to compile & run your program. `{program}` denotes a placeholder.
- Bare minimum `Hello world!` example.
- Possibly some cool Fibonacci implementations. The program will accept an argument from the command line.

Other directories:

- `_other` is a folder with some random and relatively funny stuff.
- `_transpilers` is a collection of helloworld files for transpilers.

## [Binary size comparison](#binary-size-comparison)

Here is an overview that compares the **helloworld** binary for compiled languages in bytes using the default build command on the CLI. Only explored languages with a compiler are included.
These binaries are build on [`Arch Linux x86_64 5.2.11-arch1-1-ARCH`](https://wiki.archlinux.org/index.php/Programming_languages).

Language<br>(compiler) | Binary size<br>in bytes | Binary type<br>on Linux | Runtime<br>dependency
--- | ---: | --- | ---
Lua (luac) | 149 | - | lua
Common lisp (sbcl) | 203 | fasl | sbcl
Erlang (erlc) | 652 | beam | erlang
Java (javac) | 762 | jar | java
Kotlin (kotlinc) | 1 165 | jar | java
Elixir (elixirc) | 1 220 | beam | erlang
C# (mcs) | 3 072 | exe | .NET
F# (fsharpc) | 4 096 | exe | .NET
Visual Basic (vbnc) | 6 144 | exe | .NET
Assembly x86 (as, ld) | 8 928 |
Swift (swiftc) | 14 368 |
C (gcc) | 16 544 |
Fortran (gfortran) | 16 960 |
COBOL (cobc `-free`) | 17 024 |
C++ (g++) | 17 192 |
OCaml (ocamlc)| 20 567 |
Pascal (fpc) | 181 800 |
Standard ML (mlton) | 204 728 |
Nim | 225 936 |
Ada (gnatmake) | 374 200 |
Crystal | 954 224 |
Haskell (ghc) | 1 028 200 |
D (dmd) | 1 118 304 |
Kotlin (`-include-runtime`) | 1 309 825 | jar | java
Go | 2 008 649 |
Rust (rustc) | 2 473 272 |
Groovy (groovy) | ? | jar | java
Scala (scalac) | ? | jar | java

## [Hello World](#HelloWorld)

The simplest of programs. Mandatory test that has to be done before doing anything in that language.
It tests your ability to press the right sequence of buttons to produce something on the screen.
The reward is a greeting to the world and possibly a working program.

Syntax that can be learned, depending on the implementation:
- Produce output
- Use of String data structure
- Create entry point for program

As a added benefit you know how to compile/build and/or run a program.

## [Fibonacci sequence](#Fibonacci)

Although a simple sequence at first, one can learn much about a language by implementing a function that returns the Nth fibonacci number. A factorial function is also fun to implement.

Syntax that can be learned, depending on the implementation:
- Creating a function
- Calling a function with parameters
- Reading (user) input
- Returning result from a function
- Produce pretty output
- Create variables in memory
- Swap two variables in memory
- If/then/else logic
- Comparison operators
- Use of recursion
- Use of exponentiation
- Use of standard Math library

**Test**
```
fib(N)
```

Nth number | Remarks
--- | ---
`N = 0` | should return 0
`N = 5` | should return 5
`N = 13` | is the last safe 8bit integer
`N = 24` | is the last safe 16bit integer
`N = 47` | is the last safe 32bit integer
`N = 78` | is the last safe double-precision 64bit integer (53bit)
`N = 92` | is the last safe 64bit integer
`N = 184` | is the last safe 32bit single-float
`N = 1474` | is the last representable 64bit double-float
`N = 1000000` | should not error

- Test accuracy `N = 48`, `N = 78`, `N = 92`, `N = 100`
- Test tail recursive computation `N = 1000` (can cause a stack overflow)
- Speed `N = 1000000`

Language | Integer overflow | Float overflow | Stack overflow | Speed (Algo)
--- | --- | --- | --- | ---
Common Lisp | | yes float 64bit |
Erlang | | yes float 64bit |
Haskell |  |
JavaScript | BigInt | yes float 64bit |
PHP | | yes float 64bit |
Python | | yes float 64bit |
R | | yes float 64bit |

**The fib file**

Function name | Speed | Remarks
--- | --- | ---
Fib | Slow | Slow because of unoptimized recursion, but the best to read
Fib linear | Quick | Imperative definition.
Fib formula | Quickest | Binet's formula is precise till approximate 70th fib number because of floating-point arithmetic
Fib tail recursive | Quicker | The best version in most languages. Easy to read
Fib formal | Slow | Explicitly state all code paths. `F0 = 0`, `F1 = 1`, `Fn = Fn-1 + Fn-2`
Fib memoization | Moderate | An optimized recursion. Hold a cache of return values for subsequent calls to the function.
Fib list | Quick | Return a list from 0 to N

## Todo
- How to package in every language
- How to debug without proprietary software
- Memory usage comparison in helloworld
- Fibonacci algo comparison (type limitations, stack overflows)
