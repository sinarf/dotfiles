#:!/bin/bash
# found on stackoverflow 
# https://faq.i3wm.org/question/202/what-do-you-guys-use-for-printscreen.1.html

SCREEN_DIR=/tmp/
# Uncoment this next line if you want to be prompted for the desktop 
#SCREEN_PROMPT=1


window='root'

case $1 in
  root)
    window='root';;
  active)
    window=`xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | cut -d' ' -f5`;;
esac

[ ! -z "$SCREEN_PROMPT" ] && \
  name=`i3-input -P 'screen-name: ' | sed -n '/command = /s/command = //p'`

if [ -z "$name" ];then
  if [ $window == "root" ];then
    name='root'
  else
    name=`xprop -id $window | sed -n '/WM_CLASS/s/.* = "\([^\"]*\)".*/\1\n/p'`
    [ -z "$name" ] && name='window'
  fi
fi

filename="$name-`date +%Y-%m-%d_%H-%M-%S`.png"

import -border -window $window "$SCREEN_DIR/$filename"

notify-send "Screenshot done: $SCREEN_DIR$filename"

ln -sf "$filename" $SCREEN_DIR/last.png

exit
