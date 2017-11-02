#!/bin/bash
statefilePath="/home/noah/.config/i3/mousestate"
#PROFILE_START=h77m,h77m-arch
##main_display="DVI-D-0"
##display="DVI-I-0"
##id=10
##state=$( xinput --list-props $id | grep "Device Enabled" | cut -d ":" -f 2 | tr -d "\t" )
#PROFILE_END
#PROFILE_START=acer
main_display="DP-1"
display="eDP-1"
if xinput --list "pointer:Logitech USB Receiver" ; then
	id=$( xinput --list "pointer:Logitech USB Receiver" | cut -d$'\n' -f1 | cut -d$'\t' -f2 | cut -d"=" -f2 )
	state=$( xinput --list-props $id | grep "Device Enabled" | cut -d ":" -f 2 | tr -d "\t" )
else
	state=$( cat $statefilePath )
fi
#PROFILE_END
#timeout=5
#PROFILE_START=h77m-arch
##main_display_width=$( xrandr | grep -E "^$main_display" | cut -d" " -f4 | cut -d"+" -f1 | cut -d"x" -f1 )
##main_display_height=$( xrandr | grep -E "^$main_display" | cut -d" " -f4 | cut -d"+" -f1 | cut -d"x" -f2 )
##display_width=$( xrandr | grep -E "^$display" | cut -d" " -f3 | cut -d"+" -f1 | cut -d"x" -f1 )
##display_height=$( xrandr | grep -E "^$display" | cut -d" " -f3 | cut -d"+" -f1 | cut -d"x" -f2 )
#PROFILE_END
#PROFILE_START=acer
main_display_width=$( xrandr | grep -E "^$main_display" | cut -d" " -f3 | cut -d"+" -f1 | cut -d"x" -f1 )
main_display_height=$( xrandr | grep -E "^$main_display" | cut -d" " -f3 | cut -d"+" -f1 | cut -d"x" -f2 )
display_width=$( xrandr | grep -E "^$display" | cut -d" " -f4 | cut -d"+" -f1 | cut -d"x" -f1 )
display_height=$( xrandr | grep -E "^$display" | cut -d" " -f4 | cut -d"+" -f1 | cut -d"x" -f2 )
#PROFILE_END
mouse_x=$( echo "$display_width + ($main_display_width / 2)" | bc )
mouse_y=$( echo "$main_display_height / 2" | bc )
case "$state" in
	"0")
		xinput --enable $id
		pkill unclutter
		#unclutter -root -noevents -idle $timeout &
		xdotool mousemove $mouse_x $mouse_y
		#PROFILE=acer
		synclient TouchpadOff=0
		echo -n "1" > $statefilePath
	;;
	"1")
		xinput --disable $id
		pkill unclutter
		unclutter -root -noevents -idle 0 &
		xdotool mousemove $( xdpyinfo | awk '/dimensions/{print $2}' | cut -d"x" -f1 ) 0
		#PROFILE=acer
		synclient TouchpadOff=1
		echo -n "0" > $statefilePath
	;;
esac

