#!/bin/bash

root_path="/home/noah/Pictures/Screenshots"

if [ ! -d "$root_path" ]; then
	mkdir -p $root_path
fi

year="$( date +%Y )"
month="$( date +%m )"
day="$( date +%d )"

path="${root_path}/${year}/${month}/${day}"

if [ ! -d "$path" ]; then
	mkdir -p $path
fi

extra=""
if [ "$1" == "-a" ]; then
	extra="_area"
fi
gnome-screenshot -f ${path}/$( date +%H:%M:%S )${extra}.png $@
