#!/bin/bash
source /etc/dn42/config

PEER=$1

echo "Briniging down $PEER down"
source /etc/dn42/peers/$PEER

ip netns exec dn42 ip link del $WG_INTERFACE
