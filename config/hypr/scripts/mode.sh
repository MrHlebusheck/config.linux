#!/bin/bash

. ~/.config/hypr/scripts/vars.sh
. ~/.config/hypr/scripts/binds.sh

function set_mode(){
  echo $1 > $MODE_FILE
  set_binds $1
  pkill -SIGRTMIN+1 waybar
}

case $1 in
  "init")
    set_mode "N"
    ;;
  "status")
    cat $MODE_FILE
    ;;
  "mode")
    set_mode $2
    ;;

esac
