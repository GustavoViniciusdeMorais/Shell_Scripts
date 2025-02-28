#!/bin/bash

if [ $# > 0 ]; then
    if [ "$1" == "stop" ]; then
        ip -c l
        read -p "Enter the nic name to stop scan: " BADNIC
        airmon-ng stop $BADNIC
        exit 1
    fi
fi

ip -c l
read -p "Enter the nic name: " NIC
printf "\n"
if [ -z $NIC ]; then
    NIC="eth0"
fi

airmon-ng start $NIC
printf "\n"

# get the name of the new nic
# BADNIC=$(ip -c l | grep -i wl | cut -d ' ' -f 2 | cut -d ':' -f 1)

# get the new name of the interface
ip -c l
printf "\n"
read -p "Enter the new nic name: " BADNIC

# show netowrks
airodump-ng $BADNIC
