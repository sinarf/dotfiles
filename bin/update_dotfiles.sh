#!/usr/bin/env bash

# Update local dotfiles

set -e  # stop on first error

if [ -z $DOT_FILES ]; then
    echo "the DOTFILES environement variable should be set up for this script to work"
    exit 2
fi

echo "Moving to the dotfiles directory: $DOT_FILES"
cd $DOT_FILES
echo "pulling change..."
git pull
echo "Installing packages..."
./package_install
echo "Linking dotfiles..."
./install
