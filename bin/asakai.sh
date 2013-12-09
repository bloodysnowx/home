#/bin/sh
array=(imae iwasa kanemaru kuroda komiyama takaesu nishimura hayashi fujita mutou)
num=$(( $RANDOM % 10 ))
echo ${array[$num]}
