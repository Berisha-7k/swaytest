#!/usr/bin/env sh

ANS=$(printf ' ꄗ\tLock\n ↩\tLogout\n ⏻\tPoweroff\n ↻\tReboot' | fuzzel --tabs=1 --dmenu --lines=4 --width=12 --line-height=20 --accept-nth=2 --horizontal-pad=10)

case "${ANS}" in
    'Lock')
        swaylock
        ;;
    'Logout')
        swaymsg exit
        ;;
    'Poweroff')
        shutdown now
        ;;
    'Reboot')
        sudo reboot
        ;;
    *)
        exit 1
        ;;
esac

