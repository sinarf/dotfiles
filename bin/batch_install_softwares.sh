#!/usr/bin/env bash
# basic script to install package on my arch system using paru

set -eu # stop on firt error

softwares_dir="${DOT_FILES}/softwares"

# install software from a provide package list
install_software_from_file() {
  local filename="${1}"
  echo "Installation of package from file: ${filename}"
  softwares=$(cat "${filename}")
  paru -Syu "${softwares}"
}
install_all(){
    echo "Install everything"
    for file in "${softwares_dir}"/*; do
      install_software_from_file "${file}"
    done
}

pushd "${softwares_dir}" > /dev/null
if [ ${#} -eq 0 ]; then
  filename=$(fzf --prompt="No file provided, please choose one: ")
  if [ -f "${filename}" ]; then
    install_software_from_file "${filename}"
  else
    install_all
  fi
else
  filename_param="${softwares_dir}/${1}"
  install_software_from_file "${filename_param}"
fi
popd > /dev/null
