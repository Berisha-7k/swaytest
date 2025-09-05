#!/bin/bash

# Spotify'dan çalan şarkıyı al
title=$(playerctl -p spotify metadata title)
artist=$(playerctl -p spotify metadata artist)

# Eğer Spotify çalışıyorsa workspace 4'e taşı
if pgrep -x "spotify" > /dev/null; then
    wmctrl -r "Spotify" -t 0  # Workspace numaraları 0'dan başlar, yani 3 = 4. workspace
fi

# Eğer Spotify açık değilse veya müzik çalmıyorsa uyarı göster
if [[ -z "$title" ]]; then
    echo "Pay $ 9.99 & just  music listen."
else
    echo "$title - $artist"
fi

