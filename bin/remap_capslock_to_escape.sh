#!/usr/bin/env bash
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
setxkbmap -option caps:escape
notify-send "Escape is remapped to CAPSLOCK"
