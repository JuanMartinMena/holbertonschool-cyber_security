#!/bin/bash

MAIN_DOMAIN="http://web0x05.hbtn"

while read -r subdomain; do
    url="${MAIN_DOMAIN}"
    full_url="http://${subdomain}.${MAIN_DOMAIN#http://}"

    # Hacer un curl silencioso con timeout 5s
    if curl --silent --head --fail --max-time 5 "$full_url" > /dev/null; then
        echo "OK - $full_url"
    else
        echo "No response - $full_url"
    fi
done < subdomains.txt
