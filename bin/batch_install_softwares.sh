#/usr/bin/env bash
# basic script to install package on my arch system using paru

# TODO add parameter verification

filename=$1

set +e # stop on firt error
softwares=$(cat $filename)
paru -S $softwares
