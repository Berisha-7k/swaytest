#!/usr/bin/env sh

brightness_percentage=$(brightnessctl --machine-readable | cut -d, -f4 | tr -d '%')

brightness_icons='󰽤          󰽢'

get_icon() {
    key=$(("${brightness_percentage}" / 10 + 1))
    printf '%b' "${brightness_icons}" | cut -d' ' -f"${key}"
}

printf '%s  Brightness %s%%' "$(get_icon)" "${brightness_percentage}"

