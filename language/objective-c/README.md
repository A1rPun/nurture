# Objective-C

- [Learn Objective-C in Y minutes](https://learnxinyminutes.com/docs/objective-c/)

```
$ make
$ ./obj/HelloWorld
$ make clean
```

### gcc

```
$ gcc -o {program} {program}.m
```

### clang

```
$ clang -o {program} {program}.m
```

## Development requirements

Make sure you have the objc library installed prior to installing GNUStep.
For arch linux I needed the following packages:

```
gcc-objc
gnustep-base
gnustep-make
```

`gcc-objc` can collide with `swift`

Now you can run the following commands:
