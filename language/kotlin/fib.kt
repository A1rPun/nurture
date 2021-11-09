import kotlin.math.pow
import kotlin.math.round

fun fib(n: Int): Int {
  return if (n < 2) n else fib(n - 1) + fib(n - 2)
}

fun fibLinear(n: Int): Int {
  var prevFib = 0
  var fib = 1

  repeat(n) {
    val temp = prevFib + fib
    prevFib = fib
    fib = temp
  }
  return prevFib
}

fun fibFormula(n: Int): Int {
  return round((((5.0.pow(0.5) + 1) / 2.0).pow(n)) / 5.0.pow(0.5)).toInt();
}

fun fibTailRecursive(n: Int, prevFib: Int = 0, fib: Int = 1): Int {
  return if (n == 0) prevFib else fibTailRecursive(n - 1, fib, prevFib + fib)
}

fun fibonacciGenerate(n: Int): List<Int> {
  var a = 0
  var b = 1

  fun next(): Int {
      val result = a + b
      a = b
      b = result
      return a
  }
  return generateSequence(::next).take(n).toList()
}

fun main(args: Array<String>) {
  var input = if (args.size > 0) args[0].toInt() else 29
  println(fibLinear(input))
}
