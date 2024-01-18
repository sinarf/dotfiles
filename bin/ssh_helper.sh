#!/usr/bin/env bash

server=${1}
if [[ $# -gt "2" ]]; then
  ssh "$@"
elif [ -z "${TMUX}" ]; then
  ssh -o RemoteCommand='bash -o vi' -o RequestTTY=yes "${server}"
else
  short_name=$(echo "${server}" | cut -f1 -d'.')
  tmux new-window -n "$short_name" "ssh -o RemoteCommand='bash -o vi' -o RequestTTY=yes ${server} || sleep 10"
fi
