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

Here is an overview that compares the **helloworld** binary for compiled languages in bytes using the default build command unless specified. Only explored languages with a compiler are included.
These binaries are build on `Arch Linux x86_64 5.2.11-arch1-1-ARCH`.

Language<br>(compiler) | Binary size<br>in bytes | Binary type<br>on Linux
--- | ---: | ---
Lisp (sbcl) | 203 | fasl
Erlang (erlc) | 652 | beam
Java (javac) | 762 | jar
Kotlin (kotlinc) | 1 165 | jar
Elixir (elixirc) | 1 220 | beam
C# (mcs)| 3 072 | exe
F# (fsharpc)| 4 096 | exe
Visual Basic (vbnc)| 6 144 | exe
Assembly x86 (as, ld)| 8 928 | -
Swift (swiftc) | 14 368 | -
C (gcc)| 16 544 | -
COBOL (cobc `-free`) | 17 024 | -
C++ (g++)| 17 192 | -
OCaml (ocamlc)| 20 567 | -
Pascal (fpc)| 181 800 | -
Standard ML (mlton)| 204 728 | -
Nim | 225 936 | -
Ada (gnatmake) | 374 200 | -
Crystal | 954 224 | -
Haskell (ghc)| 1 028 200 | -
D (dmd)| 1 118 304 | -
Kotlin (`-include-runtime`) | 1 309 825 | jar
Go | 2 008 649 | -
Rust (rustc)| 2 473 272 | -

```
Groovy (groovy) | ? | jar
Scala (scalac) | ? | jar
```


## Fibonacci sequence

**Test**
```
fib(N)
```
- `N = 0` should return 0
- `N = 5` should return 5
- `N = 78` is the last safe integer in JavaScript
- `N = 92` is the last safe 64bit integer
- `N = 1476` is the last representable integer in JavaScript, PHP & R
- `N = 1000000` should not error

## Todo
- How to package in every language
- How to debug without proprietary software
- Memory usage comparison in helloworld
- Fibonacci algo comparison (type limitations, stack overflows)
