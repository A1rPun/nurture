function fib() {
  if [ $1 -le 2 ] ; then
    echo $1
  else
    echo $(($(fib $[$1 - 1])+$(fib $[$1 - 2])))
  fi
}

function fibLinear() {
  prevFib=0
  fib=1
  n=$1
  while((n > 0)); do
    ((k=prevFib+fib,prevFib=fib,fib=k,n--))
  done
  echo $prevFib
}

function fibFormula() {
  echo "e($1 * l((e(.5 * l(5)) + 1) / 2)) / e(.5 * l(5))" | bc -l
}

function fibTailRecursive() {
  prevFib=${2:-0}
  fib=${3:-1}
  if [ $1 -eq 0 ] ; then
    echo $prevFib
  else
    echo $(($(fibTailRecursive $[$1 - 1] $fib $[$prevFib + $fib])))
  fi
}

input=${1:-29}
echo $(fibLinear $input)
# printf "%.0f\n" $(fibFormula $input)
