<%
Dim vbnumber
vbnumber = 29

function vbFib(n)
    if n < 2 then
        vbFib = n
    else
        vbFib = vbFib(n - 1) + vbFib(n - 2)
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
    FibTailRecursive = FibTailAuxiliary(n, 0, 1)
end function

function FibTailAuxiliary(n, prevFib, fib)
    if n = 0 then
        FibTailAuxiliary = prevFib
    else
        FibTailAuxiliary = FibTailAuxiliary(n - 1, fib, prevFib + fib)
    end if
end function
%>

<script language="javascript" runat="server">
"use strict";

var vbnumber = 8; // Doesn't get overridden
var jsnumber = vbnumber;

function jsFib(n) {
    return n < 2 ? n : jsFib(n - 1) + jsFib(n - 2);
}
</script>

<p>Fib from vb: <%=FibTailRecursive(vbnumber)%></p>
<p>Fib from js: <%=jsFib(jsnumber)%></p>
