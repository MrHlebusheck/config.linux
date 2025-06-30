#!/bin/bash

function get_title(){
    xprop -id $(bspc query -N -n focused) WM_NAME \
    | cut -d '=' -f2- \
    | cut -c3- | rev \
    | cut -c2- | rev
}

function print_title(){
  echo "(label :class \"window-title\" :text \"$(get_title)\")"
}

print_title
bspc subscribe node_focus | while read -r _; do
  print_title
done
