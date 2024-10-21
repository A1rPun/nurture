<!DOCTYPE html>
<html>
<head>
<title>Fib</title>
<style>
body { background: #222; color: #fff; }
</style>
<%
Dim vbnumber
vbnumber = 29

function vbfib(n)
    if n < 2 then
        vbfib = n
    else
        vbfib = vbfib(n - 1) + vbfib(n - 2)
    end if
end function

function FibLinear(n)
    if n < 2 then
        FibLinear = n
    end if

    dim prevFib
    dim fib

    prevFib = 0
    fib = 1

    do while n > 1
        dim temp
        temp = fib
        fib = prevFib + fib
        prevFib = temp
        n = n - 1
    loop

    FibLinear = fib
end function

function FibFormula(n)
    FibFormula = Round((((5 ^ .5 + 1) / 2) ^ n) / 5 ^ .5)
end function

function FibTailRecursive(n)
    FibTailRecursive = fibTailAuxiliary(n, 0, 1)
end function

function fibTailAuxiliary(n, prevFib, fib)
    if n = 0 then
        fibTailAuxiliary = prevFib
    else
        fibTailAuxiliary = fibTailAuxiliary(n - 1, fib, prevFib + fib)
    end if
end function

%>
<script  language="javascript" runat="server">
"use strict";

var vbnumber = 8; // Doesn't get overridden
var jsnumber = vbnumber;

function jsfib(n) {
    return n < 2 ? n : jsfib(n - 1) + jsfib(n - 2);
}
</script>
</head>
<body>

<p>Fib from vb: <%=FibTailRecursive(vbnumber)%></p>
<p>Fib from js: <%=jsfib(jsnumber)%></p>

</body>
</html>
