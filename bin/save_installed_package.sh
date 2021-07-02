#!/usr/bin/env sh

set -e # stop at first error.

echo "Saving the list of explicitly installed package..."
export SAVE_FILE_NAME="$HOME/Sync/config/linux/installed_packages/installed_packages_$HOSTNAME.txt"
pacman -Qqe > $SAVE_FILE_NAME
echo "Package list save in $SAVE_FILE_NAME"
