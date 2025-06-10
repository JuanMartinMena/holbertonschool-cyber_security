#!/bin/bash
hashcat -m 0 -a 0 "$1" /usr/share/wordlists/rockyou.txt --quiet --potfile-path=7-potfile.pot && grep -Ff "$1" 7-potfile.pot | cut -d':' -f2 | xargs > 7-password.txt
