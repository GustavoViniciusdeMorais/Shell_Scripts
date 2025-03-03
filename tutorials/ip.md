# Manage IP interfaces
```sh
NIC="eth0"
ip link show $NIC
ip link set dev $NIC down
ip link set dev $NIC address 00:11:22:33:44:55
ip link set dev $NIC up

# add new route
ip route add 192.168.0.0/24 via 192.168.0.3 dev wlp0s20f3
```
