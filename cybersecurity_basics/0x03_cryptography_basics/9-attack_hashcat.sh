#!/bin/bash
hashcat -m 0 -a 1 "$1" wordlist1.txt wordlist2.txt --quiet --potfile-disable -o tmp.txt 2>/dev/null && cut -d: -f2 tmp.txt > 9-password.txt && rm tmp.txt