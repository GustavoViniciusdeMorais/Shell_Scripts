#!/bin/bash

if [[ $1 = "--help" ]]
then
    echo "Loop throught all the needle ocorrences and replaces to replace param."
    echo "params: [needle] [replace]"
    echo "Example: ./ChangeFilesNames.sh *.txt viki.txt"
else
    echo $1;

    # j=`echo $1 | sed "s/$1/$2/" .`
    # echo mv $i $j

    for i in $1
    do
        echo $i $2
        mv $1 $2
    done

    echo $j
fi

