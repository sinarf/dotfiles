#/usr/bin/env bash
# basic script to install package on my arch system using paru

set +e # stop on firt error
dependencies=$(cat dependencies.txt)
echo "This will install the following package:"
echo $dependencies
paru -S $dependencies
