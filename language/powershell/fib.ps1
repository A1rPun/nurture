function fib {
  Param([parameter(Mandatory=$true)] [Integer] $n)
  return fib($n - 1) + fib($n - 2)
}

function fibTailRecursive {
  Param(
    [parameter(Mandatory=$true)] [Integer] $n,
    [parameter(Mandatory=$false)] [Integer] $prevFib,
    [parameter(Mandatory=$false)] [Integer] $fib,
  )

  if ($prevFib -eq $null)
  {
    $prevFib = 0
  }

  if ($fib -eq $null)
  {
    $fib = 1
  }
  return fibTailRecursive($n - 1, $fib, $prevFib + $fib)
}

Write-Output fibTailRecursive(29)
