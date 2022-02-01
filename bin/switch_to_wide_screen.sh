#!/usr/bin/env bash

if xrandr | grep -qE '^HDMI1 connected 3440x1440' ; then
  notify-send "wide screen detected, let's disable the internal screen"
  xrandr --output eDP1 --off
  xrandr --output HDMI1 --primary
  # polybar needs to be relauch after this
  sleep 5
  ~/.config/polybar/launch.sh
elif xrandr | grep -qE '^DP1 connected 3440x1440' ; then
  notify-send "wide screen detected, let's disable the internal screen"
  xrandr --output eDP1 --off
  xrandr --output DP1 --primary
  # polybar needs to be relauch after this
  sleep 5
  ~/.config/polybar/launch.sh
else
  notify-send "wide screen not detected, let's do nothing"
fi
