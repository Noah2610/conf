#!/bin/bash
#PROFILE=h77m
id=10
#PROFILE=acer
##id=$( xinput --list "pointer:Logitech USB Receiver" | cut -d$'\n' -f1 | cut -d$'\t' -f2 | cut -d"=" -f2 )
state=$( xinput --list-props $id | grep "Device Enabled" | cut -d ":" -f 2 | tr -d "\t" )
timeout=5
width=$( xdpyinfo | awk '/dimensions/{print $2}' | cut -d"x" -f1 )
height=$( xdpyinfo | awk '/dimensions/{print $2}' | cut -d"x" -f2 )
#PROFILE_START=acer
##width=$( echo "$width + $width / 2" | bc )
##height=$( echo "$height + $height / 2" | bc )
#PROFILE_END
case "$state" in
	"0")
		xinput --enable $id
		pkill unclutter
		#unclutter -root -noevents -idle $timeout &
		xdotool mousemove $( echo "$width / 2" | bc ) $( echo "$height / 2" | bc )
		echo -n "1" > /home/noah/.config/i3/mousestate
	;;
	"1")
		xinput --disable $id
		pkill unclutter
		unclutter -root -noevents -idle 0 &
		xdotool mousemove $width 0
		echo -n "0" > /home/noah/.config/i3/mousestate
	;;
esac

