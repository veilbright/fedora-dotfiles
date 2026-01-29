#!/bin/bash

marks=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .marks')

editor=$(echo "$marks" | jq 'index("editor")')

if [ "$editor" != "null" ]; then # editor is focused
  swaymsg "[con_mark=terminal]" focus
else
  swaymsg "[con_mark=editor]" focus
fi
