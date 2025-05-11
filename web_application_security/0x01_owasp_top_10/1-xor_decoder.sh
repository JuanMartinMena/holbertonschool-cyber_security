#!/bin/bash
echo "${1#\{xor\}}" | base64 -d | perl -CS -pe 's/(.)/chr(ord($1) ^ 0x95)/ge'
