#!/bin/bash

# define arrays for weekday translations
todayDE=
todayEN=
daysDE=( "Montag" "Dienstag" "Mittwoch" "Donnerstag" "Freitag" "Samstag" "Sonntag" )
daysEN=( "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday" )

i3status -c /home/noah/.config/i3/i3status.conf | while true; do
	read line

	# read files for custom output:
	barOutput=$( cat /home/noah/.bar_output )

	# change and translate day if necessary
	if [[ "$todayDE" != "$( date +%A )" ]]; then
		todayDE=$( date +%A )
		for (( count = 0; count < "${#daysEN[@]}"; count++ )); do
			if [[ "${daysDE[$count]}" == "$todayDE" ]]; then
				todayEN="${daysEN[$count]}"
				break
			fi
		done
	fi

	echo -e "$barOutput | $line $todayEN" || exit 1
	# resource heavy, slows down i3status occasionally:
	#echo -e "$timerRem $barOutput $line $(date +%A | trans -brief)" || exit 1
done
