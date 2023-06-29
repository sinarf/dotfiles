#!/usr/bin/env bash

if xrandr | grep -qE '^HDMI-1 connected 3440x1440' ; then
  notify-send "wide screen detected, let's disable the internal screen"
  xrandr --output eDP-1 --off --output HDMI-1 --primary
  # polybar needs to be relauch after this
  sleep 5
  ~/.config/polybar/launch.sh
elif xrandr | grep -qE '^DP-1 connected 3440x1440' ; then
  notify-send "wide screen detected, let's disable the internal screen"
  xrandr --output eDP-1 --off --output DP-1 --primary
  # polybar needs to be relauch after this
  sleep 5
  ~/.config/polybar/launch.sh
elif xrandr | grep -qE '^DP-3 connected .*2560x1440' ; then
  notify-send "external screen detected, let's disable the internal screen"
  xrandr --output eDP-1 --off --output DP-3 --primary
  # polybar needs to be relauch after this
  sleep 5
  ~/.config/polybar/launch.sh
else
  notify-send "External screen not detected, let's do nothing"
fi
