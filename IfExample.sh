#!/bin/bash
read -p "input number:" a
read -p "input number:" b
read -p "input operand:" operand

if [ $a -a $b -a $operand ]
then
    echo "Result: " `expr $a $operand $b`
else
    echo "Invalid data!"
fi
