# JavaScript (node)

- [Documentation](https://developer.mozilla.org/en-US/docs/Web/javascript)
- [Learn JavaScript in Y minutes](https://learnxinyminutes.com/docs/javascript/)

```
$ node {program}.js
```

### One-liner
```
$ node -e '{code}'
```

### REPL

```
$ node
```

## Knowledge / ramblings

[`reduce`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce) parameter names:
- Accumulator (acc)
- Current Value (x, cur)
- Current Index (i, idx)
- Source Array (src)

## Package management

- NPM
- Yarn
- Bower

Download vendor packages
```
$ npm install
```

## ASI

AKA Use semicolons

```
const a = {}
const b = {}
[a, b].forEach(x => x.foo = 1)
```

> Uncaught ReferenceError: can't access lexical declaration 'b' before initialization
