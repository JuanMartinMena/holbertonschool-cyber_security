#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Uso: $0 <cadena_ofuscada>" >&2
    exit 1
fi

input="${1#\{xor\}}"

decoded=$(printf '%s' "$input" | base64 -d)

key=95

escapes=""
for (( i=0; i<${#decoded}; i++ )); do
    byte=$(printf '%d' "'${decoded:$i:1}")
    xr=$(( byte ^ key ))
    escapes+=$(printf '\\x%02x' "$xr")
done

printf '%b' "$escapes"