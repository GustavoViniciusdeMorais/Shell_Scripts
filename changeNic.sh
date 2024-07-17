 #!/bin/bash

# Check if two parameters are provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <interface>"
    exit 1
fi

interface=$1
new_nic="00:11:22:33:44:55"

# Check if parameters are not empty
if [ -z "$interface" ]; then
    echo "Interface cannot be empty"
    exit 1
fi

echo "Changing $interface to $new_nic\n"

# Rename interface
ifconfig $interface down
ifconfig $interface hw ether $new_nic
ifconfig $interface up
ifconfig $interface
