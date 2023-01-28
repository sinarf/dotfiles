#!/usr/bin/env bash
#
create_empty_file_and_make_executable() {
  local filename=$1
  echo "Creating ${filename} and making excutable..."
  touch "${filename}"
  chmod +x "${filename}"
  ls "${filename}"
}

create_empty_file_and_make_executable "$1"
