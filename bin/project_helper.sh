#!/usr/bin/env bash

# @author sinarf
#
project_directory="$HOME/git"

if [[ -d $project_directory ]]; then
  mkdir -pv "$project_directory"
fi

default_directories=(
  "$HOME/.dotfiles"
  "$HOME/.config/nvim"
)

project_directories=$(find "$project_directory" -maxdepth 4 -type d -name .git -exec dirname {} \;)

project=$( echo "${default_directories[@]}" "$project_directories" | fzf)
if [[ -n ${project} ]]; then
  tmux new-window -c "${project}"
  tmux rename-window "$(basename "${project}")"
else 
  echo "No project selected, doing nothing..."
fi
