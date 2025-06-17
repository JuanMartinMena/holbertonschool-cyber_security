#!/bin/bash
find ./Security -perm -4000 -group "$1" 2>/dev/null