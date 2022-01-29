#!/usr/bin/env bash

# Update local dotfiles

set -eu  # stop on first error

if [ -z "$DOT_FILES" ]; then
    echo "the DOT_FILES environement variable should be set up for this script to work"
    echo "That variable won't be availlable on the first run, let's fix it for this time."
    dot_files=$(dirname "$0")/..
    export DOT_FILES=${dot_files}
fi
pulled=true
echo "Moving to the dotfiles directory: $DOT_FILES"
cd "$DOT_FILES"
echo "pulling change from upstream..."
git pull || (pulled=false ; echo ">>> pull failed, the code will NOT be pushed at the end of the script.")
echo "Linking dotfiles..."
stow -v1 all
if [[ "$(uname)" == Darwin ]] ; then
  stow -v1 mac
else
  stow -v1 linux
fi
if ${pulled} ; then
  echo "Pushing local modifications..."
  git push
fi
