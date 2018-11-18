#!/bin/bash

[ $# -ne 1 ] && echo "Pass An argument" && exit

case $1 in
    'h' | '-h' | 'help' | '--help')
        echo '+ adds brightness, ++ adds even more brightness'
        echo '- lowers the brightness, -- lowers even more the brightness'
        exit
    ;;

    '+')   add=10000  ;;
    '++')  add=20000  ;;
    '-')   add=-10000 ;;
    '--')  add=-20000 ;;
esac

curr_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
sum=$(echo "$curr_brightness + $add" | bc)

[ $sum -gt 120000 ] || [ $sum -le 0 ] && echo "Fuck you" || echo $sum > /sys/class/backlight/intel_backlight/brightness
