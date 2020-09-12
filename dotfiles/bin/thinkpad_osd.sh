#!/bin/sh
# Start Thinkpad OSD daemon
if [ -x /usr/bin/tpb ] &&  [ -w /dev/nvram ] && [ -r /dev/nvram ]; then
    /usr/bin/tpb -d
fi
