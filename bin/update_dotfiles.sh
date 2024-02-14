#!/usr/bin/env bash
# Update local dotfiles

set -eu

if [ -z "${DOT_FILES:-}" ]; then
    echo "the DOT_FILES environement variable should be set up for this script to work"
    echo "That variable won't be availlable on the first run, let's fix it for this time."
    dot_files=$(dirname "$0")/..
    export DOT_FILES=${dot_files}
fi

# We want those directory to exists so stow won't link the directory
# Or because some scripts are expecting to have them
needed_dirs=(
  "$HOME"/.local/share/applications
  "$HOME"/.icons/
  "$HOME"/git/sinarf
)
for needed_dir in "${needed_dirs[@]}"; do
  mkdir -pv "$needed_dir"
done

pulled=false
echo "Moving to the dotfiles directory: ${DOT_FILES}"
cd "${DOT_FILES}"
echo "pulling change from upstream..."
if git pull; then 
  pulled=true
else
 echo ">>> pull failed, the code will NOT be pushed at the end of the script."
fi

echo "Linking dotfiles..."
stow -v1 --dotfiles all
stow -v1 --target="${HOME}"/.config all-config

if [[ "$(uname)" == Darwin ]] ; then
  stow -v1 --dotfiles mac
else
  stow -v1 --dotfiles linux
  stow -v1 --target="${HOME}"/.config linux-config
  stow -v1 --target="${HOME}"/.local linux-local
  stow -v1 --target="${HOME}"/.icons linux-icons
fi

if ${pulled} ; then
  echo "Pushing local modifications..."
fi
