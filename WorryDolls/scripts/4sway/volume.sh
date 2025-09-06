#!/usr/bin/env sh

is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | cut -d':' -f2 | tr -d ' ')
volume=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | head -n -1 | cut -d/ -f2 | tr -d ' %')

[ -z "${volume}" ] && exit

volume_icons='󰕿 󰖀 󰕾  󰝝'

get_icon() {
    key=$(("${volume}" / 25 + 1))
    [ "${key}" -ge 5 ] && key=5 # anything more than 100% is considered extra volume
    printf '%s' "${volume_icons}" | cut -d' ' -f"${key}"
}

if [ "${is_muted}" = 'yes' ]; then
    printf '<span background="#bf616a"> Muted (%s) 󰝟 </span>' "${volume}"
else
    printf '%s   Volume %s%%' "$(get_icon)" "${volume}"
fi

