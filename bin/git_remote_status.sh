#!/usr/bin/env bash
#
#
# only want this when on tmux, if I am not on tmux I am probably in maintenance mode
if git rev-parse --git-dir > /dev/null 2>&1; then
  # we are in a git repository
  remote_branch=$(git rev-parse --abbrev-ref --symbolic-full-name "@{u}" 3> /dev/null)
  remote_sha1=$(git ls-remote "$(git remote get-url origin)" HEAD | cut -f1)
  [[ "$remote_branch" != "" ]] && git merge-base "$remote_sha1" "$remote_sha1" > /dev/null 2>&1
fi
