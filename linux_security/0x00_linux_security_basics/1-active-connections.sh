#!/bin/bash
sudo ss -tunp | awk '{$1=""; print substr($0,2)}' | column -t