#!/bin/bash

. ~/.config/bspwm/scripts/vars.sh

lid_state=$(cat /proc/acpi/button/lid/LID/state)

echo "$lid_state" | grep -q close

if [[ $? -eq 0 ]]; then
  ~/.config/bspwm/scripts/move_windows.sh $laptop_monitor $external_monitor
else
  bspc monitor ${laptop_monitor} -d 11 12 13 14 15 16 17 18 19 20
  bspc config -m ${laptop_monitor} border_width 2
  bspc config -m ${laptop_monitor} window_gap 4
fi

feh --bg-fill ~/.config/bspwm/wallpaper_4k.jpg\
    --bg-fill ~/.config/bspwm/wallpaper_fullhd.jpg

bspc monitor ${external_monitor} -d 1 2 3 4 5 6 7 8 9 10

bspc config -m ${external_monitor} border_width 4
bspc config -m ${external_monitor} window_gap 16

bspc config single_monocle false

bspc rule -a TelegramDesktop follow=true desktop="10"

xte "mousemove 3840 1080"

~/.config/polybar/start_dual.sh &
