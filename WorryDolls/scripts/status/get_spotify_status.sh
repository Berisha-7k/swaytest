#!/bin/bash

PLAYER="spotify"
FORMAT="{{ title }} - {{ artist }}"

STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)

if [ "$STATUS" == "Playing" ] || [ "$STATUS" == "Paused" ]; then
    playerctl --player=$PLAYER metadata --format="$FORMAT"
else
    echo ""
fi


