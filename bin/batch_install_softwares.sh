#/usr/bin/env bash
# basic script to install package on my arch system using paru

set +e # stop on firt error

softwares_dir=$DOT_FILES/softwares
if [ -n ${1+x} ]; 
then
    cd $softwares_dir
    filename=$(fzf --prompt="No file provided, please choose one: ")
else
    filename=$1
fi

softwares=$(cat $filename)
paru -S $softwares
