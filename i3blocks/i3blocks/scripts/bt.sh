#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

STATUS="$(bluetoothctl show)"
LABEL="\uf293"

echo -e $LABEL
echo -e $LABEL

POWER=$(bluetoothctl show | grep Powered | awk '{print $2}')
if [ "$POWER" = "no" ]
then
    if [ $button ]
    then
        bluetoothctl power on
    fi
else
    echo $BLUE
    if [ $button ]
    then
        DEVICE=$(bluetoothctl devices | rofi  -theme $HOME/.config/rofi/config-launcher.rasi -p " Bluetooth " -dmenu -selected-row 2 -u 0:2 | awk '/^/ {print $2}')
        bluetoothctl connect $DEVICE > /dev/null 2>&1 &
    fi
fi

