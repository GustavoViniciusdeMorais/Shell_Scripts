#!/bin/bash
runs=7
while [ "$runs" -gt 0 ]
do
    echo "$runs";
    let runs=runs-1;
done
#let dir=$1
if [ ! -z $1 ]
then
    let dir="$1"
    if [ -d $1 ]
    then
        ls -la "$1"
    fi
fi
