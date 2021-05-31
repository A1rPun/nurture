# Codepath

My own esoteric language (WIP)
Mostly ramblings, enter at your own risk!

## Syntax

Token | Usage
--- | ---
`|` | Shows context
`|in>` | Get standard in
`|0>` | Get argument by index (`|0>`=filename, `|1>`=arg1, etc.)
`->` | traverse path
`:` | param or param passing
`->>` | assignment
`?` | if value is empty then use following value
`|->` | If true move on, else go to next path
`<-` | return path in function
`[]` | loop
`(1, 2)` | list with values 1 and 2
`'42` | character
`|>` | standard output

## Example

### Hello world!

```
|-"Hello world!":print
```

### Fibonacci

```
|->fib:n
|  |->n<2->n<-
|  |->(n-1):fib+(n-2):fib<-
|->29:fib:print
```

### Factorial

```
|->factorial:n
|  |->n<2->1<-
|  |->n*(n-1)-:factorial<-
|->4:factorial:print
```

### Truth machine

```
|1>?1->>input
|->truthmachine:n
|  |->n==0->0<-
|  |->[1]
|  |  |->1:print
|>input:truthmachine
```

### 99 bottles of beer

```
|->99->>beer
|->[beer]
|  |->"{0} bottles of beer on the wall,\n"->>verse
|  |->"{0} bottles of beer!\n"-+>verse
|  |->"Take one down, pass it around\n"-+>verse
|  |->"{1} bottles of beer on the wall\n"-+>verse
|  |->(beer,--beer):verse:print
```

### Cat

```
|in>->>input
|>input
```

### Quine

```
|>"v\n|>{0}{1}{0}->>input->('34,input):input:print"->>input->('34,input):input:print
```

### Fibonacci extended

```
|1>?29->>input
|
|->fib:n
|  |->n<2->n<-
|  |->(n-1):fib+(n-2):fib<-
|
|->fibLinear:n:prevFib?0:fib?1
|  |->n<2->n<-
|  |->[--n]
|  |  |->prevFib+fib->>temp
|  |  |->fib->>prevFib
|  |  |->temp->>fib
|  |->fib<-
|
|->fibFormula->n
|  |->(((5**.5+1)/2)**n/5**.5):round<-
|
|->fibTailRecursive:n:prevFib?0:fib?1
|  |->n==0->prevFib<-
|  |->(n-1,fib,prevFib+fib):fibTailRecursive<-
|
|->fibFormal:n
|  |->n==0->0<-
|  |->n==1->1<-
|  |->(n-1):fibFormal+(n-2):fibFormal<-
|
|->("Fibonacci ",input,": ",input->fib,"\n"):print
|
|>result
```
