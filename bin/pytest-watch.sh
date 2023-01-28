#!/usr/bin/env bash

if command -v ptw >/dev/null; then
  kill $(pgrep -f ptw)
  tmux split-window -l 20 ptw --clear
  tmux last-pane
else
  echo "pytest watch ptw command not found, did you forget to setup your virtualenv?"
  exit 1
fi
