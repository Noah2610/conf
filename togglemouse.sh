#!/bin/bash
#id=10
id=$( xinput --list "pointer:Logitech USB Receiver" | cut -d$'\n' -f1 | cut -d$'\t' -f2 | cut -d"=" -f2 )
state=$( xinput --list-props $id | grep "Device Enabled" | cut -d ":" -f 2 | tr -d "\t" )
timeout=5
width=$( xdpyinfo | awk '/dimensions/{print $2}' | cut -d"x" -f1 )
height=$( xdpyinfo | awk '/dimensions/{print $2}' | cut -d"x" -f2 )
case "$state" in
	"0")
		xinput --enable $id
		pkill unclutter
		unclutter -root -idle $timeout &
		xdotool mousemove $( echo "$width / 2" | bc ) $( echo "$height / 2" | bc )
	;;
	"1")
		xinput --disable $id
		pkill unclutter
		unclutter -root -idle 0.01 &
		xdotool mousemove $width 0
	;;
esac

