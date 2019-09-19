import java.math.BigInteger;

public class Fib {
  public static long fib(int n) {
    return n < 2 ? n : fib(n - 1) + fib(n - 2);
  }

  public static long fibLinear(int n) {
    if (n < 2) return n;
    def prevFib = 0;
    def fib = 1;
    while (n > 1) {
      def temp = prevFib + fib;
      prevFib = fib;
      fib = temp;
      n--;
    }
    return fib;
  }

  public static long fibFormula(int n) {
    return Math.round(Math.pow((Math.pow(5, 0.5) + 1) / 2, n) / Math.pow(5, 0.5));
  }

  private static long fibTailAuxiliary(int n, long prevFib, long fib) {
    return n == 0 ? prevFib : fibTailAuxiliary(n - 1, fib, prevFib + fib);
  }
  public static long fibTailRecursive(int n) {
    return fibTailAuxiliary(n, 0, 1);
  }

  public static BigInteger fibLinearBig(int n) {
    def prevFib = BigInteger.valueOf(0);
    def fib = BigInteger.valueOf(1);
    while (n > 1) {
      def temp = prevFib.add(fib);
      prevFib = fib;
      fib = temp;
      n--;
    }
    return fib;
  }

  public static void main(String[] args) {
    def input = args.length > 0 ? Integer.parseInt(args[0]) : 29;
    System.out.println(fibLinear(input));
    System.out.println(fibLinearBig(input));
  }
}
