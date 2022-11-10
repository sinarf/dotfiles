#!/usr/bin/env bash

# @author sinarf
#
project_directory="${HOME}/git"

project=$(find "${project_directory}" -maxdepth 1 | fzf)
tmux new-window -c "${project}"
{
  tmux send-keys "git fetch -p || true" Enter
}
tmux rename-window "$(basename "${project}")"
