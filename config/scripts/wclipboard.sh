#!/bin/bash
cliphist list | wofi -S dmenu -c ~/.config/wofi/clip.conf | cliphist decode | wl-copy
