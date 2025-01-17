#! /bin/sh

status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

case "$1" in
	"status")
		if [ "$status" == "yes" ];
		then
			if [ "$(bluetoothctl devices Connected)" != "" ];
			then 
				echo "󰂱"
			else
				echo ""
			fi
		else 
			echo "󰂲"
		fi
		;;
	"toggle")
		if [ "$status" == "yes" ];
		then
			bluetoothctl power off
		else
			bluetoothctl power on
		fi
		;;
	"app")
		blueman-manager
		;;
esac
