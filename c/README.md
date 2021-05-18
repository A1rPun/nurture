# C

```
$ gcc -o {output} {program}.c
$ ./{output}
```

Or

```
$ make {program}
$ ./{program}
```

## Link a library

```
$ gcc -o fib fib.c -lm && ./fib
$ gcc -o canvas canvas.c `pkg-config --cflags --libs gtk+-3.0` && ./canvas &
```
