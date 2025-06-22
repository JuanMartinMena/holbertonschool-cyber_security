#!/bin/bash
iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT