#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

RAW=$(acpi | grep 'Battery 0')
arrRAW=(${RAW//,/ })

STATUS=${arrRAW[2]}
CHARGE=${arrRAW[3]}
CHARGE=$(echo $CHARGE | sed 's/%//g')
REMAINING=${arrRAW[4]}
REMAINING=$(date -d $REMAINING +%R)
LABEL_UNKNOWN=""
LABEL_CHARGING=""
LABEL_FULL=""

LABEL_80=""
LABEL_60=""
LABEL_40=""
LABEL_20=""
LABEL_10=""
LABEL_0=""

if [[ $STATUS == "Unknown" ]]
then
    echo "$LABEL_UNKNOWN UNK"
    echo ""
    echo $RED
elif [[ $STATUS == "Full" ]]
then
    echo "$LABEL_FULL $CHARGE%"
    echo ""
    echo $GREEN
elif [[ "$STATUS" == "Charging" ]]
then
    echo "$LABEL_CHARGING $CHARGE% ($REMAINING)"
    echo ""
    echo $YELLOW
else
    if [[ $CHARGE -ge 80 ]]
    then
        echo "$LABEL_80 $CHARGE% ($REMAINING)"
        echo "$CHARGE%"
    elif [[ $CHARGE -ge 60 ]]
    then
        echo "$LABEL_60 $CHARGE% ($REMAINING)"
        echo "$CHARGE%"
    elif [[ $CHARGE -ge 40 ]]
    then
        echo "$LABEL_40 $CHARGE% ($REMAINING)"
        echo "$CHARGE%"
    elif [[ $CHARGE -ge 20 ]]
    then
        echo "$LABEL_20 $CHARGE% ($REMAINING)"
        echo "$CHARGE%"
    elif [[ $CHARGE -ge 10 ]]
    then
        echo "$LABEL_10 $CHARGE% ($REMAINING)"
        echo "$CHARGE%"
    else
        echo "$LABEL_0 $CHARGE% ($REMAINING)"
        echo "$CHARGE%"
        echo $RED
        dunstify -a   "Critical Battery Level" "<span color='$RED'>Only $CHARGE% left</span>"
    fi

fi
