#!/usr/bin/env bash
#

ssh-keygen -R "$(fzf < "$HOME"/.ssh/known_hosts | awk '{print $1}')"
