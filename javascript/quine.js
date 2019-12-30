// Quine using syntactic sugar
(f = _=>`(f = ${f})()`)()

// You can remove the spaces by using 2 statements
f=_=>`f=${f};f()`;f()

// Cheating quine (REPL only)
1
