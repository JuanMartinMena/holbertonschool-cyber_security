sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT && iptables -A INPUT -j DROP
