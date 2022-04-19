#!/usr/bin/env bash

source $(dirname $0)/../colors.sh

INTERFACE="${BLOCK_INSTANCE:-wlan0}"
LABEL1=""
LABEL2=""
COLOR_DOWN=$BLUE
COLOR_UP=$FG

[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] && exit


if [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]]; then
    echo $LABEL2
    echo "down"
    echo $COLOR_DOWN
    exit
else
    QUALITY="$(iwctl station wlan0 show | grep -m 1 -oE 'RSSI .* ' | sed 's/RSSI//g' | grep -E -o '[0-9]+')"
    QUALITY=$((100-$QUALITY))

    if [ $button ]; then
        SSID="$(iwctl station wlan0 show | grep -oE 'Connected network.*' | sed 's/Connected network * //g' | sed 's/ //g')"
        dunstify -a $LABEL1 "$SSID : $QUALITY%"
    fi
    
    echo $LABEL1
    echo "up"
    echo $COLOR_UP

    exit
fi





