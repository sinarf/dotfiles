#!/bin/sh 
# author : sinarf 

set -e
Cnt="France";
echo "Filter the mirrorlist for $Cnt" 
awk -v GG="$Cnt" '{if(match($0,GG) != "0")AA="1";if(AA == "1"){if( length($2) != "0"  )print substr($0,2) ;else AA="0"} }' \
	 /etc/pacman.d/mirrorlist.pacnew > /tmp/mirrorlist
echo Select the fastest servers...
rankmirrors  -n 6 /tmp/mirrorlist > /etc/pacman.d/mirrorlist
echo 'The new mirror list is: ' 
cat /etc/pacman.d/mirrorlist
