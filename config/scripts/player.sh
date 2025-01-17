#! /bin/sh

case "$1" in
	"next")
		playerctl next
		;;
	"prev")
		playerctl previous
		;;
	"toggle")
		playerctl play-pause
		;;
	"status")
    		if [ "$(playerctl status 2>&1)" == "Playing" ];
    		then
     			echo ''
    		else
      			echo ''
    		fi
    		;;
	"name-msg")
		output=$(playerctl metadata --format '󰳩 : {{artist}}

󰽴: {{title}}' 2>&1)
		if [ "$output" == "No players found" ]; then
			dunstify '󰠃 : None'
		else 
			dunstify "$output"
		fi
		;;
esac

exit 0
