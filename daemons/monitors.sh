#!/bin/bash

while true;
do
    until [ $(xrandr -q | awk '/ con/{print $1}' | tr -d '\n') = "eDP-1" ]; do sleep 2; done        # Wait until the default monitor is the only one
    xrandr --output eDP-1 --primary --mode 3840x2160                                                # Turn it on

    until [ ! $(xrandr -q | awk '/ con/{print $1}' | tr -d '\n') = "eDP-1" ]; do sleep 2; done      # Wait until there is more than one monitor
done
