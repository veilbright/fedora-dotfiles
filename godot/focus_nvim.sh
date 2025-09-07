#!/bin/bash

/usr/bin/nvim "$@"
/usr/bin/swaymsg "[title=vgd]" focus

# godot exec flags:
# --server /tmp/godot.pipe --remote-send "<C-\><C-N>:e {file}<CR>:call cursor({line},{col})<CR>"
