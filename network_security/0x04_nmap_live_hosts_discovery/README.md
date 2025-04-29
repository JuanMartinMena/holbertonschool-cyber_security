Nmap (Network Mapper) is an open-source tool used for network exploration and security auditing. One of its primary features is Live Host Discovery, which identifies active devices on a network before conducting more in-depth scans.

What is Live Host Discovery?
Live Host Discovery is the process of detecting which devices are connected and responsive on a network.

Nmap provides several techniques for this purpose:

Ping Scan (-sn): Sends ICMP Echo Requests and other probes to determine active hosts.

TCP SYN Ping (-PS): Sends TCP SYN packets to specified ports to check for responses.

TCP ACK Ping (-PA): Sends TCP ACK packets to specified ports to determine if hosts are up.

ICMP Echo Request (-PE): Sends ICMP Echo Requests (similar to the standard ping) to identify live hosts.​