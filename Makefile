program=helloworld

help:
	echo "To build $(program) for all languages run: make build_all"
	echo "run: make build_hello to build Helloworld for Java and C#"

build_hello:
	cd java; javac Helloworld.java
	cd csharp; mcs Helloworld.cs

build_all:
# Ada
	cd ada;\
	gnatmake $(program).adb
# ASM
# as $(program).s -o $(program).o
# ld $(program).o -o $(program)
# Awk
	cd awk;\
	awk -f $(program).awk
# C
	cd c;\
	gcc -o $(program) $(program).c
# C#
#	cd csharp; mcs $(program).cs
# C++
	cd cplusplus;\
	g++ -o $(program) $(program).cpp
# COBOL
	cd cobol;\
	cobc -x -W -free $(program).cob
# Common Lisp
	cd commonlisp;\
	sbcl --non-interactive --eval '(compile-file "$(program).lisp")'
# Crystal
	cd crystal;\
	crystal build $(program).cr
# D
	cd d;\
	dmd $(program).d
# F#
	cd fsharp;\
	fsharpc $(program).fs
# Fortran
	cd fortran;\
	gfortran -o $(program) $(program).f95
# Elixir
	cd elixir;\
	elixirc $(program).ex
# Erlang
	cd erlang;\
	erlc $(program).erl
# Go
	cd go;\
	go build $(program).go
# Groovy
	cd groovy;\
	groovyc $(program).groovy
# Haskell
	cd haskell;\
	ghc -o $(program) $(program).hs
# Java
#	cd java; javac $(program).java
# Kotlin
	cd kotlin;\
	kotlinc $(program).kt -include-runtime -d $(program).
# Lua
	cd lua;\
	luac -o $(program) $(program).lua
# Nim
	cd nim;\
	nim c -r $(program).nim
# Ocaml
	cd ocaml;\
	ocamlc -o $(program) $(program).ml
# Pascal
	cd pascal;\
	fpc $(program).pas
# Rust
	cd rust;\
	rustc $(program).rs
# Scala
	cd scala;\
	scalac $(program).scala -d $(program).jar
# Standard ML
	cd standardml;\
	mlton $(program).sml
# Swift
	cd swift;\
	swiftc $(program).swift
# Visual Basic
	cd visualbasic;\
	vbnc $(program).vb
