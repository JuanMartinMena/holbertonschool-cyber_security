#!/bin/bash
HASH_FILE="$1"
WORDLIST="/usr/share/wordlists/rockyou.txt"

# Ejecuta John con la wordlist sobre el archivo de hashes
john --wordlist="$WORDLIST" --format=raw-md5 "$HASH_FILE"

# Extrae solo las contraseñas, elimina líneas vacías y limita a 2 líneas
john --show --format=raw-md5 "$HASH_FILE" | cut -d: -f2 | sed '/^$/d' | head -n 2 > 4-password.txt
