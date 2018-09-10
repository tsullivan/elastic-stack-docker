#!/bin/bash
set -x

curator \
  --config /usr/share/curator/curator.yml \
  optimize \
  --max_num_segments 1 \
  indices \
  --prefix logstash \
  --older-than 1 \
  --time-unit days
