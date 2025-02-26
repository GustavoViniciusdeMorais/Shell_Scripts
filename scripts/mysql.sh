#!/bin/bash
read -p "Enter the database name: " dbname
read -p "Enter the username: " username
read -p "Enter the password: " password
read -p "Enter the host: " host
read -p "Enter port: " port
read -p "Enter query:" query

if [ -z $host ]; then
    host="localhost"
fi
if [ -z $port ]; then
    port="3306"
fi

nc -z $host $port

if [ $? -eq 0 ]; then
    echo "Port $port is open on $host"

    if [ -z $dbname ]; then
        dbname="studies"
    fi
    if [ -z $username ]; then
        username="root"
    fi
    if [ -z $password ]; then
        password=""
    fi
    if [ -z $query ]; then
        query="SELECT * FROM books;"
    fi

    mysql -u $username --password=$password --host $host --port $port -e "use $dbname; $query;" 

else
    echo "Port $port is NOT open on $host"
fi
