#!/usr/bin/env bash

# @author sinarf
#
project_directory="${HOME}/git"

project=$(find "${project_directory}" -maxdepth 4 -type d -name .git -exec dirname {} \; | fzf)

if [[ -n ${project} ]]; then
  tmux new-window -c "${project}"
  tmux rename-window "$(basename "${project}")"
else 
  echo "No project selected, doing nothing..."
fi
