#!/bin/bash
current=$(pacmd dump-volumes | awk 'NR==1{print $8}' | sed 's/\%//')
[[ $current -lt 300 || ${1:0:1} == '-' ]] && pactl set-sink-volume 0 "$1"

