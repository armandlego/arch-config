#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

LABEL=" "
UP_DATE=$(uptime -s)
UP_DATE=$(date -d "$UP_DATE" +%s)
CUR_DATE=$(date +%s)
UPTIME=$((CUR_DATE - UP_DATE))

UPTIME_H=$((UPTIME / 3600))
UPTIME_M=$((UPTIME % 3600 / 60))

if [[ $UPTIME_H -gt 1 ]]
then
    echo "$LABEL $UPTIME_H hours, $UPTIME_M min"
elif [[ $UPTIME -gt 0 ]]
then
    echo "$LABEL $UPTIME_H hour, $UPTIME_M min"
else
    echo "$LABEL $UPTIME_M min"
fi

echo "up"

if [[ $UPTIME_H -ge 4 ]]
then
    echo $RED
elif [[ $UPTIME_H -ge 2 ]]
then
    echo $BLUE
fi

