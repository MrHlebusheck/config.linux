#! /bin/sh

feh --bg-fill ~/.config/bspwm/wallpaper_fullhd_horizontal.jpg

bspc monitor -d 1 2 3 4 5 6 7 8 9 10

bspc config border_width 2
bspc config window_gap 0

bspc config single_monocle	     true

bspc rule -a TelegramDesktop state=floating follow=true desktop="^10"

~/.config/polybar/start_single.sh &
