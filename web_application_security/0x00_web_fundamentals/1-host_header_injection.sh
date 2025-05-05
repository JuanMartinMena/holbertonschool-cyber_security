#!/bin/bash
curl -s -X POST -d "$3" -H "Host: $1" "$2"
