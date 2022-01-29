#!/usr/bin/env bash

if xrandr | grep -qE '^DP1 connected' ; then
  notify-send "wide screen detected, let's disable the internal screen"
  xrandr --output eDP1 --off
else
  notify-send "wide screen not detected, let's do nothing"
fi