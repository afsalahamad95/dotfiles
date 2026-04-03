#!/bin/bash

cpu=$(awk -v FS=" " '/cpu / {usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}' /proc/stat)
mem=$(free -m | awk '/Mem:/ {printf "%.0f", $3/$2*100}')

echo " 󰍛  ${cpu}% |    ${mem}%"

