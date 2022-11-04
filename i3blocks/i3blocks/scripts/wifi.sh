#!/usr/bin/env bash

source $(dirname $0)/../colors.sh

INTERFACE="${BLOCK_INSTANCE:-wlan0}"
LABEL1=""
LABEL2=""
LABEL3=""
LABEL4=""
COLOR_UP=$FG
COLOR_NOWIFI=$RED
COLOR_SEARCH=$YELLOW
COLOR_DOWN=$BLUE

[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] && exit

if [[ "$(iwctl station list | grep wlan0 | wc -l)" = "0" ]]
then
    echo "$LABEL4 " 
    echo "plane"
    echo $COLOR_DOWN
    exit
fi

if [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]]; then
    if [ $button ]; then
        echo "$LABEL3 "
        echo "searching"
        echo $COLOR_SEARCH
        iwctl station wlan0 scan >> /dev/null
        exit
    else
        echo "$LABEL2 "
        echo "down"
        echo $COLOR_NOWIFI
        exit
    fi
fi

QUALITY="$(iwctl station wlan0 show | grep -m 1 -oE 'RSSI .* ' | sed 's/RSSI//g' | grep -E -o '[0-9]+')"
QUALITY=$((100-$QUALITY))

if [ $button ]; then
    SSID="$(iwctl station wlan0 show | grep -oE 'Connected network.*' | sed 's/Connected network * //g' | sed 's/ //g')"
    dunstify -a $LABEL1 "$SSID : $QUALITY%"
fi

echo "$LABEL1 "
echo "up"
echo $COLOR_UP
