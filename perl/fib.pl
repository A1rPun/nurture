#! /usr/bin/perl
use strict;
use warnings;
use Math::BigInt;
use Math::BigFloat;

sub fib {
  my $n = shift;
  $n < 2 ? $n : fib($n - 1) + fib($n - 2);
}

sub fibLinear {
  my ($n, $prevFib, $fib) = (shift, 0, 1);
  ($prevFib, $fib) = ($fib, $prevFib + $fib) while --$n > 0;
  $fib;
}

sub fibFormula {
  my $n = Math::BigFloat->new(shift);
  $n = ((5 ** 0.5 + 1) / 2.0) ** $n / 5 ** 0.5;
  $n->bfround(1);
}

sub fibTailAuxiliary {
  my ($n, $prevFib, $fib) = (@_);
  $n == 0 ? $prevFib : fibTailAuxiliary($n - 1, $fib, $prevFib + $fib);
}
sub fibTailRecursive {
  fibTailAuxiliary(shift, 0, 1);
}

sub fibLinearBig {
  my $n = Math::BigInt->new(shift);
  my $prevFib = Math::BigInt->new(0);
  my $fib = Math::BigInt->new(1);
  ($prevFib, $fib) = ($fib, $prevFib + $fib) while --$n > 0;
  $fib;
}

my $input = shift;
unless (defined $input) {
  $input = 29;
}
printf("Fibonacci %d: %d\n", $input, fibTailRecursive($input));
