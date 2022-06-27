#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

TIME="$(date '+%H:%M')"
HOUR=$(date +%H)

if (($HOUR >= 20)) || (($HOUR < 8))
then
    echo -e "\ufa93 $TIME"
else
    echo -e "\ue30d  $TIME"
fi
