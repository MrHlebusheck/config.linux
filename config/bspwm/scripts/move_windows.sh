#!/bin/bash

from=$1
to=$2

for window in $(bspc query -N -m ${from} -n .window); do
  bspc node $window -m ${to}
done

for i in $(bspc query -m ${from} -D); do
  bspc desktop $i -r
done
