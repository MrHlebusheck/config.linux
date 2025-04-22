#!/bin/bash

function click(){
  case $1 in
    "left")
      ydotool click 0xc0 
      ;;
    "right")
      ydotool click 0xc1 
      ;;
  esac
}

function move(){
  case $1 in
    "left")
      ydotool mousemove -x -10 -y 0
      ;;
    "right")
      ydotool mousemove -x 10 -y 0
      ;;
    "up")
      ydotool mousemove -y -10 -x 0
      ;;
    "down")
      ydotool mousemove -y 10 -x 0
      ;;
  esac
}

case $1 in
  "click")
    click $2
    ;;
  "move")
    move $2
    ;;
  "toggle")
    toggle 
    ;;
esac
  
