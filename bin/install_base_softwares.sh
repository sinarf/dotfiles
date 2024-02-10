#!/usr/bin/env bash
set -eu

package_lst_to_install=(
  packages.lst
  desktop.lst
  dev.lst
)

for package_lst in "${package_lst_to_install[@]}"; do
  readarray -t softwares < "$DOT_FILES/softwares/$package_lst"
  paru -Syu --needed --noconfirm "${softwares[@]}"
done
