#!/usr/bin/env bash

# @author sinarf
#
project_directory="${HOME}/git"


project=$(find "${project_directory}" -maxdepth 3 -type d -name .git -exec dirname {} \; | fzf)
tmux new-window -c "${project}"
{
  tmux send-keys " [ -d .git ] && git remote show origin | grep 'out of date'" Enter
}
tmux rename-window "$(basename "${project}")"
