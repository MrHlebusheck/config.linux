#!/bin/bash

. $HOME/.config/hypr/scripts/vars.sh

layouts="$HYPR_PATH/config/layouts"
gaps="$HYPR_PATH/config/gaps"
optionL="source = $layouts"
optionG="source = $gaps"
case $1 in 
  "G")
    echo "$optionG/gaps.conf" > $gaps/index.conf
  ;;
  "F")
    echo "" > $gaps/index.conf
  ;;
  "M")
    echo "$optionL/master.conf" > $layouts/index.conf
  ;;
  "D")
    echo "$optionL/dwindle.conf" > $layouts/index.conf
  ;;
esac
