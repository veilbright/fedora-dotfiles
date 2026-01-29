#!/bin/bash

kitty --app-id code_terminal &
sleep 0.5
swaymsg "[app_id=code_terminal] mark --add terminal"
