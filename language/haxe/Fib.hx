class Fib {
    public static function main():Void {
        var arg0 = Sys.args()[0];
        var input = arg0 == null ? 29 : Std.parseInt(arg0);
        var result = fibTailRecursive(input);
        Sys.println('Fibonacci $input: $result');
    }

    private static function fib(n: Int):Int {
        return n < 2 ? n : fib(n - 1) + fib(n - 2);
    }

    private static function fibLinear(n: Int, prevFib: Int = 0, fib: Int = 1) {
        if (n < 2) return n;
        while (--n > 0) {
            var temp = fib;
            fib = prevFib + fib;
            prevFib = temp;
        }
        return fib;
    }

    private static function fibFormula(n:Int):Int {
        return Math.round(Math.pow((Math.pow(5, 0.5) + 1) / 2, n) / Math.pow(5, 0.5));
    }

    private static function fibTailRecursive(n: Int, prevFib: Int = 0, fib: Int = 1):Int {
        return n == 0 ? prevFib : fibTailRecursive(n - 1, fib, prevFib + fib);
    }
}
