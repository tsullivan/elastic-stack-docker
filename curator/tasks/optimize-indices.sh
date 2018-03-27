#!/bin/bash

curator \
  --config /usr/share/curator/curator.yml
  optimize \
  --max_num_segments 1 \
  indices \
  --prefix avocado \
  --older-than 1 \
  --time-unit days
