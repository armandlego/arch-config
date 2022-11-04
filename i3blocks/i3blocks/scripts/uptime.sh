#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

LABEL="\uf254 "
UP_DATE=$(uptime -s)
UP_DATE=$(date -d "$UP_DATE" +%s)
CUR_DATE=$(date +%s)
UPTIME=$((CUR_DATE - UP_DATE))
UPTIME=$((UPTIME / 60))

echo -e "$LABEL $UPTIME min"
echo "up"

if [[ $UPTIME_H -ge 4 ]]
then
    echo $RED
elif [[ $UPTIME_H -ge 2 ]]
then
    echo $YELLOW
else
    echo $GREEN
fi

