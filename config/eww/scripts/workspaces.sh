#!/bin/bash

function in_array(){
  for e in $2; do
    if [ "$1" == "$e" ]; then
      return 0
    fi
  done
  return 1
}

function workspaces(){
  monitor="$1"

  ws_list=$(bspc query -D -m $monitor)
  ws_occupied=$(bspc query -D -d .occupied -m $monitor)
  ws_focused=$(bspc query -D -d focused)

  eww_literal="(box :orientation \"h\" :spacing 10 :class \"workspaces-box\" :vexpand true "
  
  for ws in $ws_list; do
    in_array "$ws" "$ws_occupied"
    if [ $? -eq 0 ]; then 
      ws_state="ws-occupied"
      ico="󰋑"
    else
      ws_state="ws-unoccupied"
      ico=""
    fi
    
    if [ "$ws" == "$ws_focused" ]; then
      ws_state="ws-focused"
      ico="󰋑"
    fi

    eww_literal="$eww_literal (button :onclick \"bspc desktop -f $ws\" :class \"$ws_state\" \"$ico\")" 
  done
  
  eww_literal="$eww_literal)"
  echo $eww_literal
}

workspaces $1
bspc subscribe desktop node_transfer | while read -r _; do
  workspaces $1
done
