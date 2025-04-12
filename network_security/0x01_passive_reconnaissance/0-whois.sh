#!/bin/bash
whois $1 | awk -F: '/^(Registrant|Admin|Tech)/ && NF>1 {gsub(/^ +| +$/, "", $1); gsub(/^ +| +$/, "", $2); print $1 "," $2}' > "$1.csv"
