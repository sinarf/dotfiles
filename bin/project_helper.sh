#!/usr/bin/env bash

# @author sinarf
#
project_directory="${HOME}/git"


project=$(find "${project_directory}" -maxdepth 4 -type d -name .git -exec dirname {} \; | fzf)
tmux new-window -c "${project}"
{
  tmux send-keys " git fetch -p" Enter
}
tmux rename-window "$(basename "${project}")"
