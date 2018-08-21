#!/bin/bash
set -x

if [ -n "$MAX_INDEX_AGE" ]; then
  curator \
    /usr/share/curator/delete-indices.yml \
    --config /usr/share/curator/curator.yml
else
  echo "Skip purging old indices. MAX_INDEX_AGE is not set."
fi
