#! /bin/sh

if xrandr | grep 'HDMI-0 connected' | grep -q "3840x2160"
then
    xrandr --output eDP-1-1 --auto --rotate left --right-of HDMI-0 --output HDMI-0 --primary --auto
    export HLEB_DISPLAY_MODE=dual
else
    xrandr --output eDP-1-1 --auto --primary --rotate normal
    export HLEB_DISPLAY_MODE=single
fi
