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
These binaries are build on `Arch Linux x86_64 5.2.11-arch1-1-ARCH`.

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

Syntax that can be learned, depending on the language or implementation:
- Produce output
- Use of String type
- Create entry point for program

As an added benefit you know how to compile/build and/or run a program.

## [Fibonacci sequence](#Fibonacci)

Although a simple sequence at first, one can learn much about a language by implementing a function that returns the Nth fibonacci number. A factorial function is also fun to implement.

Syntax that can be learned, depending on the language or implementation:
- Creating a function
- Calling a function with parameters
- Optional parameters
- Reading (user) input
- Type casting to other types
- Returning result from a function
- Produce pretty output
- Create variables in memory
- Swap two variables in memory
- If/then/else logic
- Comparison operators
- Use of recursion
- Use of exponentiation
- Use of rounding
- Use of standard Math library

**Test**
```
fib(N)
```

- Test accuracy `N = 25`, `N = 50`, `N = 80`, `N = 100`
- Test `fibTailRecursive` `N = 1000` for a stack overflow
- Test speed for `fibLinear` `N = 1000000`

Bits | Max num | Fib Limit | Remarks
--- | --- | --- | ---
1 | 1 | 2 | <3 no use
signed 8 | -127 - 127 | 11 |
unsigned 8 | 0 - 255 | 13 |
signed 16 | -32767 - 32767 | 23 | |
unsigned 16 | 0 - 65535 | 24 |
signed 32 | -2147483647 - 2147483647 | 46 |
unsigned 32 | 0 - 4294967295 | 47 |
signed 53 | -9007199254740991 - 9007199254740991 | 78 |
signed 64 | -9223372036854775807 - 9223372036854775807 | 92 |
unsigned 64 | 0 - 18446744073709551615 | 93 |
signed 128 | -(2^127-1) - 2^127-1 | 184 |
unsigned 128 | 0 - 2^128-1 | 186 |

Language | Integer/Float overflow | Stack overflow | Arbitrary-precision arithmetic
--- | --- | --- | ---
Ada | 32bit | not before integer overflow | no
Assembly | | |
Awk | `N > 1476` = +Inf | no | `--bignum` param
C | | | |
C# | | | |
C++ | | | |
COBOL | | | |
Clojure | | | |
Common Lisp | | yes float 64bit | |
Crystal | | | |
D | | | |
Dart | | | |
Elixir | | | |
Erlang | | yes float 64bit |
F# | | | |
Fortran | | | |
GO | | | | yes
Groovy | | | |
Haskell | | | |
Java | | | |
JavaScript | `2**53-1` = MAX_SAFE, 2**1024 = MAX_VALUE, `Infinity` | | yes
Julia | | | |
Kotlin | | | |
Lolcode | | | |
Lua | | | |
Nim | | | |
OCaml | | | |
Octave | | | |
OpenGL | | | |
PHP | | yes float 64bit |
Pascal | | | |
Perl | | | |
Python | | yes float 64bit |
R | | yes float 64bit |
Racket | | | |
Ruby | | | |
Rust | | | |
Scala | | | |
Smalltalk | | | |
StandardML | | | |
Swift | | | |
VisualBasic | | | |
WebAssembly | | | |

**The fib file**

Function name | Time complexity | Remarks
--- | --- | ---
Fib | O(n^n) | Slow because of unoptimized recursion, but the best to read
Fib linear | O(n) | Imperative definition, ok to read
Fib formula | O(1) | Binet's formula is precise till approximate 70th fib number because of floating-point arithmetic
Fib tail recursive | O(n) | Optimized recursion. Easy to read
Fib formal | O(n^n) | Explicitly state all code paths. `F0 = 0`, `F1 = 1`, `Fn = Fn-1 + Fn-2`
Fib list | O(n) | Return a list from 0 to N
Fib generator | O(n) | Generate the Nth number based on the amount of `next` calls (starting with 0)
Fib fast doubling | O(log n) | Precise and fast implementation, kind of readable

## Todo
- How to package in every language
- How to debug without proprietary software

## Sources

- [Programming Language Comparison](https://en.wikipedia.org/wiki/Comparison_of_programming_languages)
- [Meta Programming](https://en.wikipedia.org/wiki/Metaprogramming)
- [Arch languages](https://wiki.archlinux.org/index.php/Programming_languages)
- [Termux languages](https://wiki.termux.com/wiki/Development_Environments)

### Fib sources

- [0](rosettacode.org/wiki/Fibonacci_sequence)
- [1](https://www.scriptol.com/programming/fibonacci.php)
- [1](https://www.nayuki.io/page/fast-fibonacci-algorithms)
- [2](https://wiki.haskell.org/The_Fibonacci_sequence)
- [3](https://www.geeksforgeeks.org/program-for-nth-fibonacci-number/)
- [5](https://gist.github.com/t-nissie/641df996b9035f85b230)
