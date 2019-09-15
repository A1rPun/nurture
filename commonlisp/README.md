# Common lisp

## Use

```
CL-USER> {code}
```

Or
```
$ sbcl

* {code}
```

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
