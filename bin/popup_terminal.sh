#!/usr/bin/env bash
# @author sinarf
#
# This is my popup / dropdown terminal

DISPLAY_RESOLUTION=$(xdpyinfo | grep 'dimensions:')

if [[ "$DISPLAY_RESOLUTION" == *"3440"* ]]
then
    # wide screen detected
    tdrop -h 84% -x 20% -w 60% -y 8% -a kitty -e tmux attach
else
    tdrop -h 84% -x 3% -w 94% -y 8% -a kitty -e tmux attach
fi
