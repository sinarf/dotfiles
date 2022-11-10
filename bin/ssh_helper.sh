#!/usr/bin/env bash

server=${1}
tmux new-window "ssh -o RemoteCommand='bash -o vi' -o RequestTTY=yes ${server}"
short_name=$(echo "${server}" | cut -f1 -d'.')
tmux rename-window "${short_name}"
