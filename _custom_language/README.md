# Custom Language

[Resources](https://thesephist.com/posts/pl/)
[Tutorial Python](http://www.jayconrod.com/posts/37/a-simple-interpreter-from-scratch-in-python--part-1-)
[Tutorial Haskell](https://www.stephendiehl.com/llvm/)


- Static / Dynamic typed
- Strong / Weakly typed
- Imperative / Functional
- Compiled / Interpreted

### Static / Dynamic typed

**static**

```
Phi phi = new Phi();
```

**dynamic**

```
phi = {};
```

### Strongly / Weakly typed

**strongly**

```
phiString = String(1) + "." + String(618);
```

**weakly**

```
phiString = 1 + "." + 618;
```

### Compiled / Interpreted

**compiled**

```
[code] -> (compile) -> [program]
[input] -> (program) -> [output]
```

**interpreted**

```
[code] & [input] -> (interpret) -> [output]
```

## Example interpreter

Source code used in example

```
phi = √5 / 2 + .5;
```

### Lexer

Split characters in the source code into tokens

```
["phi", "=", "√", "5", "/", "2", "+", ".5", ";"]
```

### Parser

Organize the tokens into an abstract syntax tree (AST) to make an intermediate representation of the source code.

```
"phi" "=" "√" "5" "/" "2" "+" ".5"
   \    \   \  /   |  /   /   /
    \    \   \/   /  /   /   /
     \    \   \  |  /   /   /
      \    \   \ | /   /   /
       \    \   \|/   /   /
        \    \   \   |   /
         \    \   \  |  /
          \    \   \ | /
           \    |   \|/
            \   |   /
             \  |  /
              \ | /
               \|/
```

Evaluation in parser combinations:

- a = (√5)
- b = (a / 2)
- c = (b + .5)
- d = (phi = c)

### Evaluate OR

Evaluate the AST and handle a state

```
phi
```

`phi` holds the value `1.618033988749895` but we didn't do anything with it


### Machine code generation
