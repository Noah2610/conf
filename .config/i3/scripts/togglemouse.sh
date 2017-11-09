#!/bin/bash
statefilePath="/home/noah/.config/i3/mousestate"
#timeout=5
#PROFILE_START=h77m-arch
##id=10
##state=$( xinput --list-props $id | grep "Device Enabled" | cut -d ":" -f 2 | tr -d "\t" )
##main_display="DVI-D-0"
##display="DVI-I-0"
##output=$( xrandr | grep -E "^$main_display|^$display"  )
##main_display_output=$( echo "$output" | grep -E "^$main_display" | cut -d" " -f4 | cut -d"+" -f1 )
##display_output=$( echo "$output" | grep -E "^$display" | cut -d" " -f3 | cut -d"+" -f1 )
##main_display_width=$( echo "$main_display_output" | cut -d"x" -f1 )
##main_display_height=$( echo "$main_display_output" | cut -d"x" -f2 )
##display_width=$( echo "$display_output" | cut -d"x" -f1 )
##display_height=$( echo "$display_output" | cut -d"x" -f2 )
#PROFILE_END
#PROFILE_START=acer
##if xinput --list "pointer:Logitech USB Receiver" ; then
##	id=$( xinput --list "pointer:Logitech USB Receiver" | cut -d$'\n' -f1 | cut -d$'\t' -f2 | cut -d"=" -f2 )
##	state=$( xinput --list-props $id | grep "Device Enabled" | cut -d ":" -f 2 | tr -d "\t" )
##else
##	state=$( cat $statefilePath )
##fi
##main_display="DP-1"
##display="eDP-1"
##output=$( xrandr | grep -E "^$main_display|^$display"  )
##main_display_output=$( echo "$output" | grep -E "^$main_display" | cut -d" " -f3 | cut -d"+" -f1 )
##display_output=$( echo "$output" | grep -E "^$display" | cut -d" " -f4 | cut -d"+" -f1 )
##main_display_width=$( echo "$main_display_output" | cut -d"x" -f1 )
##main_display_height=$( echo "$main_display_output" | cut -d"x" -f2 )
##display_width=$( echo "$display_output" | cut -d"x" -f1 )
##display_height=$( echo "$display_output" | cut -d"x" -f2 )
#PROFILE_END
#PROFILE_START=aware
if xinput --list "pointer:Logitech USB Receiver" ; then
	id=$( xinput --list "pointer:Logitech USB Receiver" | cut -d$'\n' -f1 | cut -d$'\t' -f2 | cut -d"=" -f2 )
	state=$( xinput --list-props $id | grep "Device Enabled" | cut -d ":" -f 2 | tr -d "\t" )
else
	state=$( cat $statefilePath )
fi
display="HDMI-1"
output=$( xrandr | grep -E "^$main_display|^$display"  )
display_output=$( echo "$output" | grep -E "^$display" | cut -d" " -f4 | cut -d"+" -f1 )
display_width=$( echo "$display_output" | cut -d"x" -f1 )
display_height=$( echo "$display_output" | cut -d"x" -f2 )
#PROFILE_END
#PROFILE_START=h77m-arch,acer
##mouse_x=$( echo "$display_width + ($main_display_width / 2)" | bc )
##mouse_y=$( echo "$main_display_height / 2" | bc )
#PROFILE_END
#PROFILE_START=aware
mouse_x=$( echo "$display_width / 2" | bc )
mouse_y=$( echo "$display_height / 2" | bc )
#PROFILE_END
case "$state" in
	"0")
		xinput --enable $id
		pkill unclutter
		#unclutter -root -noevents -idle $timeout &
		xdotool mousemove $mouse_x $mouse_y
		#PROFILE=acer
##		synclient TouchpadOff=0
		echo -n "1" > $statefilePath
	;;
	"1")
		xinput --disable $id
		pkill unclutter
		unclutter -root -noevents -idle 0 &
		xdotool mousemove $( xdpyinfo | awk '/dimensions/{print $2}' | cut -d"x" -f1 ) 0
		#PROFILE=acer
##		synclient TouchpadOff=1
		echo -n "0" > $statefilePath
	;;
esac

