#!/bin/bash

function get_volume(){
  muted=$(pamixer --get-mute)
  volume=$(pamixer --get-volume)

  echo "{\"muted\": $muted, \"volume\": $volume}"
}

get_volume
pactl subscribe | while read -r msg; do
  if $msg | grep -q change; then
    get_volume
  fi
done
