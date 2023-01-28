#!/usr/bin/env bash
#
set -eu

if [ -n "${VIRTUAL_ENV:-}" ]; then
  echo "You already are in a virtual environment, exit before running this script"
  exit 1
fi

echo "Cleanning existing virtual env"
pipenv --rm || echo "Cannot clean virtual env, it happens when the virtual env does not exists. Continuing..."

pipenv sync --dev
pipenv run pip install -e .
pipenv run pytest-watch.sh
pipenv run "${SHELL}"
