#!/bin/bash
if [ -z $1 ]; then
    host="localhost"
else    
    host=$1
fi

if [ -z $2 ]; then
    port=80
else    
    port=$2
fi

ping -c 1 $host > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Host $host is reacheble"
else
    echo "Host $host is NOT reacheble"
fi

# nc is netcat
# -z Only scan for listening daemons
# > /dev/null Redirects stdout (normal output) to /dev/null, which is a special device that discards anything written to it.
# 2>&1 Redirects stderr (error output) to stdout.

nc -z $host $port > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Port $port is open on $host"
else
    echo "Port $port is closed on $host"
fi
