#!/bin/sh -e
#
# Author: Jamie Strandboge <jamie@ubuntu.com>
# Copyright (C) 2009 Canonical Ltd.
#
# This script is distributed under the terms and conditions of the GNU General
# Public License, Version 3 or later. See http://www.gnu.org/copyleft/gpl.html
# for details.
#
# Quick script to run on a desktop system to get AppArmor notifications. This
# is to help with development and should not be considered production quality.
#

logfile="/var/log/kern.log"

tail -f "$logfile" | while read message; do
    if echo "$message" | grep -q -v "audit" ; then
        continue
    fi
    #zenity --warning --title "AppArmor Message" --text "$message"
    notify-send -i gtk-dialog-warning -u critical -t 30000 -- "AppArmor Message" "$message"
    sleep 1
done
