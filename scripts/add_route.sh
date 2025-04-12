#!/bin/bash
read -p "Network address: " destination
printf "\n"
if [ -z $destination ]; then
    destination="192.168.0.2/24"
fi
read -p "Gateway for next hop router: " gateway
printf "\n"
if [ -z $gateway ]; then
    gateway="192.168.0.1"
fi
read -p "Computer network interface: " interface
printf "\n"
if [ -z $interface ]; then
    interface="eth0"
fi

routes=$(ip route show)

if echo $routes | grep -q "$destination via $gateway";then
    echo "Route exists";
else
    echo "Adding route";
    ip route add $destination via $gateway dev $interface
    ip route show
    echo "Route added";
fi
