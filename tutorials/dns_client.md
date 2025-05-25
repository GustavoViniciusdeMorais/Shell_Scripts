# DNS Client
- [script](../scripts/dns_client.sh)
```bash
#!/bin/bash
nameserver1="1.1.1.1"
conf_file="/etc/resolv.conf"
echo "nameserver $nameserver1" >> $conf_file
echo "dns servers updated at $conf_file";
```
