#! /bin/sh

feh --bg-fill ~/.config/bspwm/wallpaper.jpg \
    --bg-fill ~/.config/bspwm/wallpaper_cat.png

bspc monitor HDMI-0 -d 1 2 3 4 5 6 7 8 9 10
bspc monitor eDP-1-1 -d 11 12 13 14 15 16 17 18 19 20

bspc config -m HDMI-0 border_width 4
bspc config -m HDMI-0 window_gap 16

bspc config -m eDP-1-1 border_width 2
bspc config -m eDP-1-1 window_gap 4

bspc config single_monocle false

bspc rule -a TelegramDesktop follow=true desktop="^20"

~/.config/polybar/start_dual.sh &
