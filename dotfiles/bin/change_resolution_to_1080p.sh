#!/bin/sh 

# change the resolution 
# source : https://wiki.archlinux.org/index.php/Xrandr
#

# To find the value of the output run xrandr with no option. Look for the connected thing ;) 
OUTPUT='eDP1'
xrandr --output $OUTPUT --mode 1920x1080
