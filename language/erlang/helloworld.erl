-module(helloworld).
-export([to_string/0]).
to_string() -> io:fwrite("hello, world\n").
