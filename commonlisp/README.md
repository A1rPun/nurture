# Common lisp

- [Community documentation](https://lispcookbook.github.io/cl-cookbook/)
- [Learn Common lisp in Y minutes](https://learnxinyminutes.com/docs/common-lisp/)

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
