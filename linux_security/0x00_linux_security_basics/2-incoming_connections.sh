#!/bin/bash

# Allow incoming connections on port 80 for IPv4 (TCP)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Block all other incoming connections for IPv4
iptables -A INPUT -p tcp -j DROP

# Allow incoming connections on port 80 for IPv6 (TCP)
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT

# Block all other incoming connections for IPv6
ip6tables -A INPUT -p tcp -j DROP

# Output a message to indicate that the rules have been updated
echo "Rules updated"
