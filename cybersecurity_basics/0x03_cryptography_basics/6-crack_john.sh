#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt --format=Raw-SHA256 "$1" && john --show --format=Raw-SHA256 "$1" | grep ':' | cut -d':' -f2 | xargs > 6-password.txt
