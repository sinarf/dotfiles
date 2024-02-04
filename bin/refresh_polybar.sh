#!/usr/bin/env bash
#
set -eu
polybar_launcher=$HOME/.config/polybar/launch.sh

if [ -z "${polybar_launcher:-}" ]; then
  notify-send "Could not find polybar_launcher at: '$polybar_launcher'"
else
  $polybar_launcher
  notify-send "Polybar relaunched..." ""
fi
