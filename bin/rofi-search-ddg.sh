#!/bin/sh

export DDG_ARGS='["-n", 5]'
export ROFI_SEARCH='ddgr'

rofi -modi blocks -blocks-wrap rofi-search -show blocks -lines 4 -eh 4 
