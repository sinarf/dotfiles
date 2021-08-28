#!/bin/sh

noteFilename="$HOME/Sync/pkb/main/diary/$(date +%Y-%m-%d).md"

if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $noteFilename
fi

$EDITOR -c "norm Go" \
  -c "norm Gcc## $(date +%H:%M)" \
  -c "norm G2o" \
  -c "norm zz" $noteFilename

