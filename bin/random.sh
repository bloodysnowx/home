getRandom()
{
    echo $(($(od -vAn -N4 -tu4 < /dev/random) % 10))
}

for i in `seq 1 10`
do
    str=""
    for j in `seq 1 10`
    do
        rand=`getRandom`
        str=$str", "$rand
    done
    echo $str
done
