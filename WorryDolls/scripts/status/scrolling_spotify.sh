#!/bin/bash
zscroll -l 30 \
  --delay 0.2 \
  --scroll-padding " • " \
  --scroll 1 \
  --update-check true "/home/x3ck/Documents/scripts/get_spotify_status.sh" &
wait
