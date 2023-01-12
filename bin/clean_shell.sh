#!/usr/bin/env bash
#
# clean and format script.
#
# ERROR CODES:
error_no_shellcheck=13
error_no_shfmt=14
error_no_patch=15
error_file_not_found=44
error_missing_parameter=55

if [ ${#} -eq 0 ]; then
  echo "No file provided!"
  exit ${error_missing_parameter}
else
  file_list=$*
  echo "List of files to clean: ${file_list}"
fi

if ! command -v shellcheck >/dev/null; then
  echo "ERROR: shellcheck not found please install it."
  exit ${error_no_shellcheck}
fi

if ! command -v shfmt >/dev/null; then
  echo "ERROR: shfmt not found, please install it"
  exit ${error_no_shfmt}
fi

if ! command -v patch >/dev/null; then
  echo "ERROR: patch not found, please install it"
  exit ${error_no_patch}
fi

for file in ${file_list}; do
  if [ -f "${file}" ]; then
    echo "Fixing ${file}...."
    shellcheck -f diff "${file}" | patch "${file}"
    echo "Formating ${file}...."
    shfmt -w "${file}"
  else
    echo "ERROR: ${file} not found"
    exit ${error_file_not_found}
  fi
done
