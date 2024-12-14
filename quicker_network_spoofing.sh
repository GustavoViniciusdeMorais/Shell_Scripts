#!/bin/bash
hostnamectl set-hostname example.com
echo "New hostname: " && hostname
interface="wlp0s20f3"
new_nic="00:11:22:33:44:55"
ifconfig $interface down
ifconfig $interface hw ether $new_nic
ifconfig $interface up
ifconfig $interface
