#! /usr/bin/env bash

PID=$(pgrep -f "polybar --reload -c $HOME/.config/polybar/catppuccin-frappe/config.ini -l error infobar")

if [ $? = 0 ]; then 
  for x in $PID; do
    kill -9 $PID
  done
else 
  polybar --reload -c ~/.config/polybar/catppuccin-frappe/config.ini -l error infobar &
fi
