# IP Tables
```bash
iptables -L | head -n 10
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT 2 -s 192.168.0.3 -j DROP
iptables -D INPUT 2
```
