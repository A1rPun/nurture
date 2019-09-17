# Common lisp

- [Community documentation](https://lispcookbook.github.io/cl-cookbook/)
- [Learn Common lisp in Y minutes](https://learnxinyminutes.com/docs/common-lisp/)
- [Optimizing Fibonacci](http://fare.tunes.org/files/fun/fibonacci.lisp)

```
CL-USER> {code}
```

Or
```
$ sbcl

* {code}
```

Or
```
$ sbcl --script {program}.lisp
```

### One-liner
```
sbcl --non-interactive --eval '{code}'
```
*`--non-interactive` means no REPL*

## Compile

```
$ sbcl --non-interactive --eval '(compile-file "{program}.lisp")'
$ chmod +x {program}.fasl
$ ./{program}.fasl
```

## Example

CL-USER> (+ .5 (* .5 (expt 5 .5)))
1.618034
CL-USER> (+ (/ (sqrt 5) 2) .5)
1.618034
CL-USER> (/ (+ (sqrt 5) 1) 2)
1.618034

# Information

`(loop repeat n)` is the same as `(loop :for i :from 0 upto n)`
