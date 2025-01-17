#!/usr/bin/env bash

uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

shutdown=''
reboot=''
lock=''
suspend=''
logout='󰗽'
yes=''
no=''

rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye ${USER}" \
		-mesg "Uptime: $uptime" \
		-theme ~/.config/rofi/powermenu.rasi
}

run_rofi() {
	echo -e "$shutdown\n$reboot\n$logout\n$lock" | rofi_cmd
}

chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
			systemctl poweroff
        ;;
    $reboot)
			systemctl reboot
        ;;
    $lock)
      playerctl pause
      xdg-screensaver lock
        ;;
    $logout)
			bspc quit
        ;;
esac
