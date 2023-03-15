#!/bin/bash
source /etc/dn42/config

ip netns add dn42
ip netns exec dn42 ip addr add 127.0.0.1/8 scope host dev lo
ip netns exec dn42 ip link set lo up
