#!/bin/bash
source /etc/dn42/config

PEER=$1

echo "Briniging peer $PEER up"
source /etc/dn42/peers/$PEER
wg-quick up $WG_INTERFACE
ip link set $WG_INTERFACE netns dn42

ip netns exec dn42 ip link set $WG_INTERFACE up
ip netns exec dn42 ip addr add $ROUTER_IP peer $PEER_IP dev $WG_INTERFACE
ip netns exec dn42 ip addr add $LOCAL_IP_V6 peer $PEER_IP_V6 dev $WG_INTERFACE
