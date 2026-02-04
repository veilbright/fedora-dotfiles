#!/bin/bash

marks=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .marks')

primary=$(echo "$marks" | jq 'index("primary")')

if [ "$primary" != "null" ]; then # primary is focused
  swaymsg "[con_mark=secondary]" focus
else
  swaymsg "[con_mark=primary]" focus
fi
