#!/bin/bash

# PREV=100;
# while true;
# do
    # LEVEL=100
    
    # if [[ $(acpi -b | grep Discharging) ]]; then
       # LEVEL=$(acpi -b | cut -f 4 -d " " | grep -oP "\d+")
    # fi
    
    # if [ $LEVEL -lt $PREV ] && [ $LEVEL -le 15 ]; then
        # DISPLAY=:0.0 /usr/bin/notify-send "low battery - $LEVEL% left" "$(acpi -b)"
        # PREV=$LEVEL

        # if [ `expr $LEVEL % 5` = 0 ]; then
            # mpg123 './megalovania but its just the first four notes.mpeg'
        # fi
    # fi

    # sleep 10s

# done;


# /sys/class/power_supply/BAT0

# percentage=$(cat /sys/class/power_supply/BAT0/capacity)
# status=$(cat /sys/class/power_supply/BAT0/status)
