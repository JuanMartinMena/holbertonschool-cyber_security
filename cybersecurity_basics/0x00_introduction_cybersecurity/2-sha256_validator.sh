#!/bin/bash
echo "$2  $1" > /tmp/hash_check.txt && sha256sum -c /tmp/hash_check.txt && echo "$1: OK" || echo "$1: Not The Same"
