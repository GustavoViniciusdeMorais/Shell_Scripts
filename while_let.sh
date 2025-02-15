#!/bin/bash
runs=7
while [ "$runs" -gt 0 ]
do
    echo "$runs";
    let runs=runs-1;
done
#let dir=$1
if [ $1 > 0 ]
then
    ls -la "$1"
else
    echo "$1 is not a directory"
fi
