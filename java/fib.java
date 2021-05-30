import java.math.BigInteger;

public class fib {
  public static long fib(int n) {
    return n < 2 ? n : fib(n - 1) + fib(n - 2);
  }

  public static long fibLinear(int n) {
    if (n < 2) return n;
    int prevFib = 0;
    int fib = 1;
    while (n > 1) {
      int temp = prevFib + fib;
      prevFib = fib;
      fib = temp;
      n--;
    }
    return fib;
  }

  public static long fibFormula(int n) {
    return Math.round(Math.pow((Math.pow(5, .5) + 1) / 2, n) / Math.pow(5, .5));
  }

  private static long fibTailAuxiliary(int n, long prevFib, long fib) {
    return n == 0 ? prevFib : fibTailAuxiliary(n - 1, fib, prevFib + fib);
  }

  public static long fibTailRecursive(int n) {
    return fibTailAuxiliary(n, 0, 1);
  }

  public static BigInteger fibLinearBig(int n) {
    BigInteger prevFib = BigInteger.ZERO;
    BigInteger fib = BigInteger.ONE;

    while (n > 1) {
      BigInteger temp = prevFib.add(fib);
      prevFib = fib;
      fib = temp;
      n--;
    }
    return fib;
  }

  private static BigInteger[] fibFastAuxiliary(int n) {
    if (n == 0) return new BigInteger[] { BigInteger.ZERO, BigInteger.ONE };

    BigInteger[] fibs = fibFastAuxiliary((int)Math.floor(n / 2));
    BigInteger prevFib = fibs[0];
    BigInteger fib = fibs[1];
    BigInteger temp = fib.multiply(BigInteger.valueOf(2));

    temp = temp.subtract(prevFib);
    temp = temp.multiply(prevFib);
    prevFib = prevFib.multiply(prevFib);
    fib = fib.multiply(fib);
    fib = fib.add(prevFib);

    return n % 2 == 0 ? new BigInteger[] { temp, fib } : new BigInteger[]{ fib, temp.add(fib) };
  }

  public static BigInteger fibFastDoubling(int n) {
    return fibFastAuxiliary(n)[0];
  }

  public static void main(String[] args) {
    int input = args.length > 0 ? Integer.parseInt(args[0]) : 29;
    System.out.format("Fibonacci %d: %d%n", input, fibFastDoubling(input));
  }
}
