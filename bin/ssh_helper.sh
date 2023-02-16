#!/usr/bin/env bash

server=${1}
if [[ $# -gt "1" ]]; then
  ssh "$@"
elif [ -z "${TMUX}" ]; then
  ssh -o RemoteCommand='bash -o vi' -o RequestTTY=yes "${server}"
else
  tmux new-window "ssh -o RemoteCommand='bash -o vi' -o RequestTTY=yes ${server}"
  short_name=$(echo "${server}" | cut -f1 -d'.')
  tmux rename-window "${short_name}"
fi
