#!/usr/bin/env bash

# this script will setup my custom neovim configuration

nvim_config_dir="$HOME/.config/nvim"
git_branch='spring.2022.cleaning'
git_url='git@github.com:sinarf/dotnvim.git'

if [ -d "$nvim_config_dir" ]; then
  echo "$nvim_config_dir already exists"
else 
  echo "Getting configuration from $git_url branch: $git_branch"
  git clone --branch $git_branch $git_url "$nvim_config_dir"
fi
# this will auto install the plugins
nvim "$nvim_config_dir/lua/conf/plugins.lua"
