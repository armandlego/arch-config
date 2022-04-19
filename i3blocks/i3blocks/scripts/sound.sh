#!/usr/bin/env bash

source $(dirname $0)/../colors.sh

QUERY=$(amixer get Master | tail -n 1)
STATUS=$(echo "${QUERY}" | grep -wo "on")
VOL=$(echo "${QUERY}" | awk -F ' ' '{print $5}' | tr -d '[]%')
LABEL_OFF=""
LABEL_ON=""


if [[ "${STATUS}" == "on" ]]; 
then
  echo "$LABEL_ON ${VOL}%"
  echo "${VOL}%"
  echo $MAGENTA
else
  echo "$LABEL_OFF ${VOL}%"
  echo "mute"
  echo $FG
fi
