#!/usr/bin/env bash

export DOT_FILES="${HOME}/.dotfiles"

if command -v paru ; then
  echo "paru is already ready, skipping installation..."
else
  echo "Installation of paru..."
  sudo pacman -S base-devel --needed
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  pushd /tmp/paru > /dev/null || exit 1
  makepkg -si
  popd > /dev/null  || exit 1
fi

# install what needed for dotfile setup
paru -Syu git stow

echo "Setting up dotfiles in ${DOT_FILES}"
git clone git@github.com:sinarf/dotfiles.git "${DOT_FILES}"

export PATH="${DOT_FILES}/bin:${PATH}"
