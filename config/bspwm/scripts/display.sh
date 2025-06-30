#!/bin/bash

if xrandr | grep 'HDMI-0 connected' | grep -q "3840x2160"
then
    xrandr --output HDMI-0 --primary --auto --output eDP-1-1 --auto --rotate normal --left-of HDMI-0 
    export HLEB_DISPLAY_MODE=dual
else
    xrandr --output eDP-1-1 --auto --primary --rotate normal
    export HLEB_DISPLAY_MODE=single
fi

