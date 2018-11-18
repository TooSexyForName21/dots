#!/bin/bash

echo $(xrandr -q | awk '/primary/{print $4}' | cut -d'+' -f1)
LOCK_SCREEN_WALLPAPER=${1:-~/Pictures/Wallpapers/milky_way_12-wallpaper-1920x1080.jpg}
convert -scale $(xrandr -q | awk '/primary/{print $4}' | cut -d'+' -f1) $LOCK_SCREEN_WALLPAPER /tmp/scaled_lockscreen.jpg && i3lock -tefn -i /tmp/scaled_lockscreen.jpg
