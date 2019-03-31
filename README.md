# Nurture

[Yet another programming chrestomathy](http://www.rosettacode.org)

**Contents**

- Small how to compile & run your program
- Hello world example
- Fibonacci example (if present)

**ToDo**

- create a nice TOC
- classlike object in every language
- more syntax definitions in every language
- how to package in every language
- how to debug (in VSCode preferably)
- pascallike: turbopascal, delphi
- javalike: clojure, scala, groovy
- others: assembly, nim, reasonml, haskell, perl, ruby

## Batch

```
C:\> {program}.bat
```

## C

```
$ gcc -o {output} {program}.c
$ ./{output}
```
Or
```
$ make {program}
$ ./{program}
```

## C++

```
$ g++ -o {output} {program}.cpp
$ ./{output}
```
Or
```
$ make {program}
$ ./{program}
```

## Elixir

```
$ iex {module}.ex

Interactive elixir
iex(1)> {module}.{function}
:ok
```
Or
```
$ elixir -r {module}.ex -e '{module}.{function}'
```

## Erlang

```
$ erl

Eshell
1> c({module}).
{ok,{module}}
2> {module}:{function}().
ok
```

## Go

```
$ go run {program}.go
```
Or
```
$ go build {program}.go
$ ./{program}
```

## HTML

```
$ {browser} {page}.html
```

## Java

```
$ javac {program}.java
$ java {program}
```

Or create a jar and run it

## JavaScript (node)

```
$ node {program}.js
```

## Kotlin

```
$ kotlinc {program}.kt -include-runtime -d {program}.jar
$ java -jar {program}.jar
```

## Lisp

```
CL-USER> Invoke krakaboom
```

## Lua

```
$ lua {program}.lua
```

## PHP

```
$ php {program}.php
```

## Python

```
$ python {program}.py
```

## Ruby

```
$ ruby {program}.rb
```

## Rust

```
$ rustc {program}.rs
$ ./{program}
```

## Shell

```
$ ./{program}.sh
```
