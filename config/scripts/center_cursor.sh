#!/bin/bash

function xinfo {
  xwininfo -id $id
}

id=$(bspc query -N -n)

if [ $? -ne 0 ]; then
  exit 0
fi

x=$(xinfo | grep "Absolute upper-left X:" | cut -d ":" -f2)
y=$(xinfo | grep "Absolute upper-left Y:" | cut -d ":" -f2)

w=$(xinfo | grep "Width:" | cut -d ":" -f2)
h=$(xinfo | grep "Height:" | cut -d ":" -f2)

mx=$((x+w/2))
my=$((y+h/2))

xte "mousemove $mx $my"

