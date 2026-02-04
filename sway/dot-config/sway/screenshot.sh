#!/usr/bin/bash

tmp=$(mktemp)
mv $tmp $tmp.png
tmp="$tmp.png"
grim -g "$(slurp)" - > "$tmp"
wl-copy "$tmp"
