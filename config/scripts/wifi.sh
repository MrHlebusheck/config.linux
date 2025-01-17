# /bin/sh

case "$1" in
	"signal")
		signal_strength=$(iwconfig wlo1 | grep Signal | awk '{print $4}' | cut -d= -f2)
  
		if [ "$(nmcli radio wifi)" == "disabled" ];
		then
			echo "󰤭"
	
		elif nmcli networking connectivity | grep none > /dev/null; 
		then
	        	echo "󰤯"
		elif [ -n "$signal_strength" ] && [ "$signal_strength" -le -50 ];
		then
		        echo "󰤟"
		elif [ -n "$signal_strength" ] && [ "$signal_strength" -le -50 ];
		then
		        echo "󰤢"
		elif [ -n "$signal_strength" ] && [ "$signal_strength" -le -30 ];
		then
		        echo "󰤥"
		else
			echo "󰤨"
		fi
		;;
	"app")
		kitty -e nmtui
		;;
	"toggle")
		if [ "$(nmcli radio wifi)" == "disabled" ];
		then
			nmcli radio wifi on
		else
			nmcli radio wifi off
		fi
		;;
  "name-msg")
    if [ "$(nmcli radio wifi)" == "disabled" ];
		then
			dunstify '󰤭  : Off'
		else
      name=$(iwgetid -r wlo1)
      dunstify "󰤨  : $name"
		fi
		;;
esac

exit 0;
