#!/bin/bash

if [[ $1 = "--help" ]]
then
    echo "Read file content."
    echo "params: [file path]"
    echo "Example: ./ReadFile.sh name.txt"
else
    while read line; do
        echo $line
    done < $1
fi
