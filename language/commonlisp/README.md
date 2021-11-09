# Common lisp

- [Community documentation](https://lispcookbook.github.io/cl-cookbook/)
- [Learn Common lisp in Y minutes](https://learnxinyminutes.com/docs/common-lisp/)
- [Optimizing Fibonacci](http://fare.tunes.org/files/fun/fibonacci.lisp)

```
$ sbcl --script {program}.lisp
```

### REPL

```
CL-USER> {code}
```

Or

```
$ sbcl

* {code}
```

### One-liner

```
sbcl --non-interactive --eval '{code}'
```

_`--non-interactive` means no REPL_

## Compile

```
$ sbcl --non-interactive --eval '(compile-file "{program}.lisp")'
$ chmod +x {program}.fasl
$ ./{program}.fasl
```

## Example

```
CL-USER> (+ .5 (* .5 (expt 5 .5)))
1.618034
CL-USER> (+ (/ (sqrt 5) 2) .5)
1.618034
CL-USER> (/ (+ (sqrt 5) 1) 2)
1.618034
```

## Packages

- [Use package](https://github.com/jwiegley/use-package)

```
(package-initialize)
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
;; usepackage is installed
```

# Information

`(loop repeat n)` is the same as `(loop :for i :from 0 upto n)`
