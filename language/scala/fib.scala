object Fibonacci {
  def fib(n: Int): Int =
    if (n < 2) n else fib(n - 1) + fib(n - 2);

  def fibLinear(n: Int): Int = {
    if (n < 2) return n;
    var prevFib = 0
    var fib = 1
    (2 to n) foreach (x => {
      val temp = prevFib + fib;
      prevFib = fib;
      fib = temp;
    })
    return fib;
  }

  def fibFormula(n: Int): Int =
    math.round(math.pow((math.pow(5, 0.5) + 1) / 2, n).toFloat / math.pow(5, 0.5).toFloat)

  def fibTailRecursive(n: Int, prevFib: Int = 0, fib: Int = 1): Int =
    if (n == 0) prevFib else fibTailRecursive(n - 1, fib, prevFib + fib);

  def fibFormal(n: Int): Int = n match {
    case 0 => 0
    case 1 => 1
    case _ => fibFormal(n - 1) + fibFormal(n - 2)
  }

  def main(args: Array[String]): Unit = {
    val input = if (args.length > 0) args(0).toInt else 29
    println("Fibonacci " + input + ": " + fibLinear(input))
  }
}
