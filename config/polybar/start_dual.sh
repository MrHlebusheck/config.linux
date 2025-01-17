#! /bin/sh

killall polybar
polybar -c ~/.config/polybar/config.ini -q primary_4k &
polybar -c ~/.config/polybar/config.ini -q secondary_fullhd

