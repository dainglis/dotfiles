#!/bin/bash

# brightnote (xbacklight manipulator / notifier)
# created on 2019-05-24
# by dainglis
# 
# depends on 'dunst', 'dunstify', 'xbacklight'

# arbitrary id value for dunst notification
dunst_id=55
dunst_timeout=1100
xbacklight_args="-time 2 -steps 2"
script_sleep=".06s"
lockdir=/tmp/brightnote.lock    # use as mutex


# check for mutex, create if it is not there
if mkdir "$lockdir"; then
    echo "Modifying brightness"
else
    echo "Cannot modify brightness, locked"
    exit 128
fi


# get initial xbacklight brightness value
br=$(xbacklight -get | cut -d. -f1)


if      [ "$1" = "inc" ]; then
    echo "Increasing brightness"

    if      [ $br -le 0 ]; then
        xbacklight -set 1 $xbacklight_args
    elif    [ $br -lt 10 ]; then
        xbacklight -set 10 $xbacklight_args
    else
        xbacklight -inc 10 $xbacklight_args
    fi

elif    [ "$1" = "dec" ]; then
    echo "Decreasing brightness"

    if      [ $br -gt 10 ]; then
        xbacklight -dec 10 $xbacklight_args
    elif    [ $br -gt 1 ]; then
        xbacklight -set 1 $xbacklight_args
    else
        xbacklight -set 0 $xbacklight_args
    fi

else
    echo "Requires one of 'inc', 'dec'"
    exit 1
fi

# get xbacklight brightness value
br=$(xbacklight -get | cut -d. -f1)

# brightness notification using dunst
dunstify --replace=$dunst_id --timeout=$dunst_timeout "backlight $br%"

# sleep and release mutex, limiting brightness change rate
sleep $script_sleep
rmdir "$lockdir"
