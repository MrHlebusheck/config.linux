#!/bin/bash

function set_binds(){
  binds="$HYPR_PATH/config/binds"
  option="source = $binds"
  case $1 in 
    "N")
      echo "$option/normal.conf" > $binds/index.conf
    ;;
    "R")
      echo "$option/resize.conf" > $binds/index.conf
    ;;
    "M")
      echo "$option/mouse.conf" > $binds/index.conf
    ;;
    "U")
      echo "$option/utils.conf" > $binds/index.conf
    ;;
    "L")
      echo "$option/layouts.conf" > $binds/index.conf
    ;;
  esac
}
