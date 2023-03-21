#!/usr/bin/env bash

if ! command -v npm-groovy-lint >/dev/null; then
  echo "npm-groovy-lint not found, install it first"
  exit 20
fi

npm-groovy-lint --config "${HOME}"/.config/groovylintrc.json --output /tmp/npm-groovy-lint.json --format "$1"
