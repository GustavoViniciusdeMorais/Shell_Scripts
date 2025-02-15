#!/bin/bash

if [ -z $1 ]; then
    host="google.com"
else    
    host=$1
fi

if [ -z $2 ]; then
    qty=3
else    
    qty=$2
fi

result=$(ping -c $qty $host)
echo "$result"