function fib() {
  if [ $1 -le 2 ] ; then
    echo $1
  else
    echo $(($(fib $[$1-1])+$(fib $[$1-2])))
  fi
}

function fibLinear() {
  f=0
  j=1
  n=$1
  while((n > 0)); do
    ((k=f+j,f=j,j=k,n--))
  done
  echo $f
}

input=${1:-29}
echo $(fibLinear $input)
