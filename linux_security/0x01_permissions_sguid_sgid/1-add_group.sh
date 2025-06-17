#!/bin/bash
addgroup "$1" 2>/dev/null
chgrp "$1" "$2"
chmod g+rx "$2"