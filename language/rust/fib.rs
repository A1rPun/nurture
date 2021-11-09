use std::env;

#[allow(dead_code)]
fn fib(n: usize) -> usize {
  if n < 2 {
    n
  } else {
    fib(n - 1) + fib(n - 2)
  }
}

#[allow(dead_code)]
fn fib_pattern(n: usize) -> usize {
  match n {
    0 => 0,
    1 => 1,
    n => fib(n - 1) + fib(n - 2),
  }
}

#[allow(dead_code)]
fn fib_tail_recursive(n: usize) -> usize {
  fn fib_tail_auxiliary(n: usize, prev_fib: usize, fib: usize) -> usize {
    match n {
      0 => prev_fib,
      n => fib_tail_auxiliary(n - 1, fib, prev_fib + fib),
    }
  }
  fib_tail_auxiliary(n, 0, 1)
}

#[allow(dead_code)]
fn fib_linear(mut n: usize) -> usize {
  if n < 2 {
    n
  } else {
    let mut prev_fib = 0;
    let mut fib = 1;
    while n > 1 {
      let temp = prev_fib + fib;
      prev_fib = fib;
      fib = temp;
      n -= 1
    }
    fib
  }
}

#[allow(dead_code)]
fn fib_formula(n: usize) -> f32 {
  let root = 5_f32.sqrt();
  let phi = (1.0 + root) / 2.0;
  (phi.powi(n as i32) / root).round()
}

fn main() {
  let args: Vec<_> = env::args().collect();
  let input = if args.len() > 1 {
    args[1].parse::<usize>().unwrap()
  } else {
    29
  };
  println!("{}", fib_linear(input));
}
