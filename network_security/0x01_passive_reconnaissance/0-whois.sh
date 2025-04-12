#!/bin/bash
whois $1 | paste -sd ' ' - | awk -F: '{gsub(/^ +| +$/, "", $1); gsub(/^ +| +$/, "", $2); if ($1 ~ /^(Registrant|Admin|Tech).* (Organization|State\/Province|Country|Email)$/) print $1 "," $2}' > "$1.csv"
