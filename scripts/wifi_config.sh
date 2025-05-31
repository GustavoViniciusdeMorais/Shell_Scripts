#!/bin/bash
interface="wlp0s20f3"
ssid="Gustavo2G"
password=""
# temp conf file
wpa_config=$(mktemp)
cat << EOF > $wpa_config
ctrl_interface=/var/run/wpa_supplicant
network={
    ssid="$ssid"
    psk="$password"
}
EOF
wpa_supplicant -i $interface -c $wpa_config
# new ip
dhclient $interface
# remove temp conf
rm $wpa_config
echo "connected to $ssid"
