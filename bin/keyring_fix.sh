#!/usr/bin/env bash

set -eu

# if this does not work, you should try to move the /etc/pacman.d/gnupg/
# Then run this script yet again, might take a while

sudo pacman-key --init
sudo pacman-key --populate
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring
