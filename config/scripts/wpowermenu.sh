#!/bin/bash

options=" ⏻ \n  \n"

chosen=$(echo -e "$options" | wofi -c ~/.config/wofi/power.conf -s ~/.config/wofi/power.css --dmenu --title "Power Menu")

case $chosen in
    " ⏻ ")
        shutdown now
        ;;
    "  ")
        reboot
        ;;
    *)
        exit 0
        ;;
esac
