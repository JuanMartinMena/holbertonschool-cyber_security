#!/bin/bash
addgroup --quiet "$1"
chown :"$1" "$2"
chmod g+rx "$2"