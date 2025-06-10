#!/bin/bash
HASH_FILE="$1"
WORDLIST="/usr/share/wordlists/rockyou.txt"

john --wordlist="$WORDLIST" --format=raw-md5 "$HASH_FILE"

john --show --format=raw-md5 "$HASH_FILE" | cut -d: -f2 > 4-password.txt
