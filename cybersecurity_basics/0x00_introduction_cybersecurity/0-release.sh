#!/bin/bash
lsb_release -d | awk '{print $1}'
