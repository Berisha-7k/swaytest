#!/bin/bash

# Çalan şarkıyı al
title=$(playerctl metadata title)
artist=$(playerctl metadata artist)

# Eğer Spotify açık değilse uyarı göster
if [[ -z "$title" ]]; then
    echo "Spotify açık değil veya müzik çalmıyor."
else
    echo " $title - $artist"
fi

