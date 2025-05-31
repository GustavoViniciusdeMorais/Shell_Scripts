#!/bin/bash

my_square_root() {
    read -p "Type number to get the square root: " a
    if [ "$a" -lt 0 ]; then
        echo "Error: Cannot calculate square root of a negative number" >&2
        return 1
    fi
    
    i=0
    while [ "$i" -le "$a" ]
    do
        square=$((i**2))
        if [ "$square" -eq "$a" ]
        then
            echo "Square root of $a is: $i"
            return 0
        elif [ "$square" -gt "$a" ]
        then
            echo "No exact integer square root found for $a" >&2
            return 1
        fi
        i=$((i + 1))
    done
}

my_square_root