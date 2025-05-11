#!/bin/bash
echo "${1#\{xor\}}" | base64 -d | xxd -p | tr -d '\n' | sed 's/../\\x&/g' | xargs -0 printf "%b" | \
    perl -pe 's/(.)/chr(ord($1)^0x95)/ge'
