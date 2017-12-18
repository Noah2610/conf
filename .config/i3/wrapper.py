#!/usr/bin/env python
# -*- coding: utf-8 -*-

# This script is a simple wrapper which prefixes each i3status line with custom
# information. It is a python reimplementation of:
# http://code.stapelberg.de/git/i3status/tree/contrib/wrapper.pl
#
# To use it, ensure your ~/.i3status.conf contains this line:
#    output_format = "i3bar"
# in the 'general' section.
# Then, in your ~/.i3/config, use:
#    status_command i3status | ~/i3status/contrib/wrapper.py
# In the 'bar' section.
#
# In its current version it will display the cpu frequency governor, but you
# are free to change it to display whatever you like, see the comment in the
# source code below.
#
# © 2012 Valentin Haenel <valentin.haenel@gmx.de>
#
# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License (WTFPL), Version
# 2, as published by Sam Hocevar. See http://sam.zoy.org/wtfpl/COPYING for more
# details.

import sys
import json

# NOAH edit:
from subprocess import check_output
from subprocess import CalledProcessError
import re
daysDE = [ "Montag", "Dienstag", "Mittwoch",  "Donnerstag", "Freitag", "Samstag",  "Sonntag" ]
daysEN = [ "Monday", "Tuesday",  "Wednesday", "Thursday",   "Friday",  "Saturday", "Sunday"  ]
sep = { 'full_text' : '%s' % "|", 'name' : 'separator', 'color' : '#999999' }

def get_barOutput():
    """ output from $HOME/.bar_output """
    with open('/home/noah/.bar_output') as fp:
        arr = fp.readlines()
        if len(arr) > 0:
            return arr[0].strip()
        else:
            return ""


def get_weekday():
    """ display weekday """
    today = check_output(["date", "+%A"]).strip().decode("utf-8")
    #PROFILE=h77m-arch || acer || aware
    return today
    for day in range(len(daysDE)):
        if today == daysDE[day]:
            return daysEN[day]
    else:
        return ""


def get_storage():
    """ get available storage """
    #PROFILE=h77m
    ##arr = check_output(["df", "/dev/sdc2", "/dev/sdc4", "-B", "GB"]).strip().decode("utf-8").split(" ")
    #PROFILE=h77m-arch
    arr = check_output(["df", "/dev/sdb1", "/dev/sdb2", "-B", "GB"]).strip().decode("utf-8").split(" ")
    #PROFILE=acer
    ##arr = check_output(["df", "/dev/sda1", "/dev/sda2", "-B", "GB"]).strip().decode("utf-8").split(" ")
    #PROFILE=aware
    ##arr = check_output(["df", "/dev/sda1", "/dev/sda2", "-B", "GB"]).strip().decode("utf-8").split(" ")
    for i in range(len(arr) - 1, 0, -1):
        if arr[i] == '':
            del arr[i]
    return " " + str(arr[14]) + "/" + str(arr[9]) + ""


def get_volume():
    """ get current Master volume level """
    arr = check_output('amixer sget Master | grep -oG "\[.*\]" | tr "\n" " " | cut -d" " -f1,2 | tr -d "[]%"', shell=True).strip().decode("utf-8").split(" ")
    vol = int(arr[0])
    volOutput = str(arr[1])
    #PROFILE=h77m-arch || acer || aware
    volMidpoint = 50
    if volOutput == "off":
        return " " + str(vol) + "%"
    elif vol == 0:
        return " " + str(vol) + "%"
    elif vol >= volMidpoint:
        return " " + str(vol) + "%"
    elif vol < volMidpoint:
        return " " + str(vol) + "%"
    else:
        return str(vol) + "%"
    """
    off:''
    down:''
    up:''
    """


def get_cmus_status():
    """ get current track info """
    try:
        arr = check_output(["cmus-remote", "-Q"]).strip().decode("utf-8").split("\n")
    except CalledProcessError as err:
        return ""

    if arr[0] == "status paused" or arr[0] == "status stopped" or arr[0] == "cmus-remote: cmus is not running":
        return ""

    output = " "
    artist = ""
    title = ""
    duration = -1
    position = -1
    positionRel = -1
    positionBar = ""

    for i in range(len(arr) - 1):
        if arr[i].find("tag artist") != -1:
            artist = arr[i].replace("tag artist ", "")
            if len(artist) > 20:
                artist = artist[:17] + "..."
            artist += " - "
        elif arr[i].find("tag title") != -1:
            title = arr[i].replace("tag title ", "").replace("_"," ").replace(".mp3","")
            if len(title) > 50:
                title = title[:47] + "..."
        elif arr[i].find("duration") != -1:
            duration = int(arr[i].replace("duration ", ""))
        elif arr[i].find("position") != -1:
            position = int(arr[i].replace("position ", ""))

    if title == "":
        pos = arr[1].rfind("/") + 1
        track = arr[1][pos:].replace("_"," ").replace(".mp3","")
        if len(track) > 70:
            track = track[:67] + "..."
        output += track
    else:
        output += artist + title

    if duration != -1 and position != -1:
        positionRel = int((float(position) / float(duration)) * 10)
        positionBar += "["
        for i in range(10):
            if positionRel >= i:
                positionBar += "#"
            elif positionRel < i:
                positionBar += "-"
        positionBar += "]"
        output += " " + positionBar

    output += " "
    return output


def get_mouseState():
    """ get current mouse activation state  """
    with open('/home/noah/.config/i3/mousestate') as fp:
        arr = fp.readlines()
        if len(arr) > 0:
            if arr[0] == "0":
                return {'full_text' : '%s' % "", 'name' : 'mousestate', "color": "#888888"}
            elif arr[0] == "1":
                return {'full_text' : '%s' % "", 'name' : 'mousestate', "color": "#00ff00"}
        else:
            return ""


def get_vnstat():
    """ get total rx of today """
    #PROFILE=h77m || h77m-arch || aware
    interface = "enp2s0"
    #PROFILE=acer
##    interface = "enp3s0f1"
    output = check_output(["vnstat", "-i", interface, "--oneline"]).strip().decode("utf-8").split(";")
    if output[0] == interface + ": Not enough data available yet.":
        return ""
    rx = output[3].replace(" ","")
    total = output[10].replace(" ","")
    ret = (" " + rx + "/" + total)
    return ret


def get_calcurse_apt():
    """ get next apointment withing the next 24h from calcurse """
    output = check_output(["calcurse", "-n"]).strip().decode("utf-8")
    if len(output) == 0:
        return ""
    ret = re.sub("[\[\]]", "", output.split("\n")[1]).strip()
    if len(ret) > 20:
        ret = ret[:17] + "..."
    return ret


def get_memory():
    """ get free memory """
    output = re.sub(" +"," ", check_output(["free", "-m"]).strip().decode("utf-8").split("\n")[1]).split(" ")
    #free = " " + output[3] + "M"  # free
    free = " " + output[6] + "M"   # available
    if len(free) > 0:
        return free
    else:
        return ""



def get_governor():
    """ Get the current governor for cpu0, assuming all CPUs use the same. """
    with open('/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor') as fp:
        return fp.readlines()[0].strip()

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
        # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        # CHANGE THIS LINE TO INSERT SOMETHING ELSE
        #j.insert(0, {'full_text' : '%s' % get_governor(), 'name' : 'gov'}) # powersave / performance

        barOutput = get_barOutput()

        # display storage
        #PROFILE_START=!powersave
        #PROFILE_START=h77m
##        j.insert(1, {'full_text' : '%s' % get_storage(), 'name' : 'storage'})
##        # vnstat rx of today
        #PROFILE_END
        #PROFILE_END

        #PROFILE_START=h77m-arch
        j.insert(1, {'full_text' : '%s' % get_vnstat(), 'name' : 'vnstat'})
        j.insert(1, {'full_text' : '%s' % get_storage(), 'name' : 'storage'})
        j.insert(1, {'full_text' : '%s' % get_memory(), 'name' : 'memory'})
        j.insert(0, {'full_text' : '%s' % get_volume(), 'name' : 'volume'})
        #PROFILE_END
        #PROFILE_START=acer
##        j.insert(2, {'full_text' : '%s' % get_vnstat(), 'name' : 'vnstat'})
##        j.insert(2, {'full_text' : '%s' % get_storage(), 'name' : 'storage'})
##        j.insert(2, {'full_text' : '%s' % get_memory(), 'name' : 'memory'})
##        j.insert(1, {'full_text' : '%s' % get_volume(), 'name' : 'volume'})
        #PROFILE_END
        #PROFILE_START=aware
##        j.insert(1, {'full_text' : '%s' % get_vnstat(), 'name' : 'vnstat'})
##        j.insert(1, {'full_text' : '%s' % get_storage(), 'name' : 'storage'})
##        j.insert(1, {'full_text' : '%s' % get_memory(), 'name' : 'memory'})
##        j.insert(0, {'full_text' : '%s' % get_volume(), 'name' : 'volume'})
        #PROFILE_END

        j.insert(0, {'full_text' : '%s' % get_calcurse_apt(), 'name' : 'next_apt'})

        # display volume level
        #PROFILE=h77m
##        j.insert(0, {'full_text' : '%s' % get_volume(), 'name' : 'volume'})

        j.insert(0, {'full_text' : '%s' % get_cmus_status(), 'name' : 'cmus-status', 'color' : '#55aaaa'})

        # display custom bar output:
        if barOutput != "":
            j.insert(0, sep)
            j.insert(0, {'full_text' : '%s' % barOutput, 'name' : 'custom_output', 'color' : '#90C3D4'})

        # display weekday:
        j.insert(len(j) - 1, sep)
        j.insert(len(j) - 1, {'full_text' : '%s' % get_weekday(), 'name' : 'weekday'})

        # display mouse state message:
        j.insert(len(j) - 3, get_mouseState())

        # and echo back new encoded json
        print_line(prefix+json.dumps(j))

