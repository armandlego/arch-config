#!/bin/bash

source $(dirname $0)/../colors.sh

FREE=$(awk '/^Mem/ {print $4}' <(free -m))
LABEL="RAM "

echo "$LABEL $FREE Mi"
echo $FREE Mi

if [ "$FREE" -le 1024 ]
then
    echo $RED
elif [ "$FREE" -le 2048 ]
then
    echo $YELLOW
elif [ "$FREE" -le 3072 ]
then
    echo $BLUE
fi


