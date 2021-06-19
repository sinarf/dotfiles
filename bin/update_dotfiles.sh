#!/usr/bin/env bash

# Update local dotfiles

set -e  # stop on first error

echo test
cd ~/.dotfiles
git pull
./package_install
./install
