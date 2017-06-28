#!/bin/bash

path="/home/noah/.config/i3/spaceState"
spaceState=$( cat $path )

pkill xcape
if [ $spaceState -eq 0 ]; then			# activate
	xmodmap /home/noah/.Xmodmap
	xcape -t 250 -e "Super_L=space"
	spaceState=1

elif [ $spaceState -eq 1 ]; then		# deactivate
	xmodmap -e "keycode 65 = space space"
	spaceState=0

else
	spaceState=1
	echo -n $spaceState > $path
	exit
fi

echo -n $spaceState > $path
echo $spaceState | spd-say -e
