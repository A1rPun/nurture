# C++

```
$ g++ -o {output} {program}.cpp
$ ./{output}
```

Or

```
$ make {program}
$ ./{program}
```

## Link a library

```
g++ -o canvas canvas.cpp `pkg-config gtkmm-3.0 --cflags --libs`
```

## Remarks

- Function order does matter else you get a `was not declared in this scope` error.
