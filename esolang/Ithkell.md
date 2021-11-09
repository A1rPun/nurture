# Ithkell

- Language inspired by Ithkuil and Haskell

My own language (WIP)
Mostly ramblings, enter at your own risk!

### Comment
`# foo`

### Types
`true` & `false` # Boolean aka byte
`1` # Int BigInt
`1.0` # Float
`'f'` # Char
`[1..29]` # List
`"foo"` # String (List of Chars)
`null` # Explicit not a value
`empty` # Undefined value

### Math
`1 + 28` # 29
`1 - 30` # -29
`7.25 * 4` # 29
`145 / 5` # 29
`145 // 5` # Floor (Integer) division
`5 ** 5` # 3125
`round(((5 ** 0.5 + 1) / 2) ** 29 / 5 ** 0.5)` # 514229

### Scalar
`myVar` # empty

### Assignment
`myVar = 29` # 29

### Comparison
`not true` # false
`0 is 1` # false
`"" is empty String` # true
`0 < 1` # true
`0 > 1` # false
`0 >= 1` # false

### Guards & if/then/elseif/else & switch case & pattern match

```
fib n = | n < 2 = n | _ = fib (n - 1) + fib (n - 2)
fib 29
```

### Function pattern matching

```
fibFormal 0 = 0
fibFormal 1 = 1
fibFormal n = fibFormal (n - 1) + fibFormal (n - 2)
```

### List slicing
`[][0]` # Head
`[][1:]` # Tail
`[][:-1]` # Init
`[][-1]` # Last
`[][::-1]` # Reverse list
