#!/bin/bash
if [ -z $1 ]; then
    NIC="eth0"
else    
    NIC=$1
fi

ip link show $NIC
ip link set dev $NIC down
ip link set dev $NIC address 00:11:22:33:44:55
ip link set dev $NIC up
ip link show
hostnamectl set-hostname "ghost"
hostnamectl status