#!/bin/bash
# x_display_switcher
# provides options for rofi to switch display layout using xrandr

X_OPT_DUP="duplicate"
X_OPT_EXT="extend"
X_OPT_OFF="off"

X_OPTIONS="$X_OPT_DUP\n$X_OPT_EXT\n$X_OPT_OFF"

DUNST_ID=552
DUNST_TIMEOUT=1100
DUNST_OUT=""

if [ "$#" -eq "0" ]; then
    echo -e $X_OPTIONS
elif [ "$#" -eq "1" ]; then
    
    if [ "$1" = "$X_OPT_DUP" ]; then
        xrandr --output HDMI1 --auto --same-as eDP1
        DUNST_OUT="HDMI: duplicate"
    elif [ "$1" = "$X_OPT_EXT" ]; then
        xrandr --output HDMI1 --auto --output HDMI1 --left-of eDP1 
        DUNST_OUT="HDMI: extend"
    elif [ "$1" = "$X_OPT_OFF" ]; then
        xrandr --output HDMI1 --off
        DUNST_OUT="HDMI: off"
    else
        exit 1
    fi

    dunstify --replace=$DUNST_ID --timeout=$DUNST_TIMEOUT "$DUNST_OUT"
fi

