#!/bin/bash
counter=0
i3status -c /home/noah/.config/i3/i3status.conf | while true; do
	read line
	# display literal day
	#echo "$line $(date +%a)" || exit 1
	echo -e "$(cat /home/noah/.rem-time) $(cat /home/noah/.bar_output) $line $(date +%A | trans -brief)" || exit 1
done
