#!/bin/sh
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
notify-send "Escape is remapped to CAPSLOCK"
