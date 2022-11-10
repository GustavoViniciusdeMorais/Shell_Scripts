#!/bin/bash

a=10

while [ $a -gt 0 ]
do
    echo $a
    ((--a))
done

echo ""
echo "For range"

for val in {1..5}
do
    echo $val
done

echo ""
echo "For: "

for ((i=0;i<=5;i++)){
    echo $i
}
