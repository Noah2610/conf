#!/bin/bash
echo -n "Search for track: "
read x
cmus-remote -C /"$x"
cmus-remote -C win-activate
