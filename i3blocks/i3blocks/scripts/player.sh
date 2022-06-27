#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

COL_PLAY=$GREEN
COL_PAUSE=$CYAN

ICON_PLAY=""
ICON_PAUSE=""
ICON_STOP=""

CUR_ICON=""
CUR_COL=""

if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
    $(playerctl previous)
elif [[ "${BLOCK_BUTTON}" -eq 2 ]]; then
    $(playerctl play-pause)
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
    $(playerctl next)
fi

sleep 0.5

PLAYER_STATUS=$(playerctl status)
INFO_TITLE=$(playerctl metadata title)
INFO_ALBUM=$(playerctl metadata album)
INFO_ARTIST=$(playerctl metadata artist)

if [[ "${PLAYER_STATUS}" = "Paused" ]]; then
  CUR_ICON="${ICON_PAUSE}"
  CUR_COL="${COL_PAUSE}"
elif [[ "${PLAYER_STATUS}" = "Playing" ]]; then
  CUR_ICON="${ICON_PLAY}"
  CUR_COL="${COL_PLAY}"
else
  CUR_ICON="${ICON_STOP}"
fi

if [[ "${INFO_TITLE}" != "" ]] && [[ "${INFO_ARTIST}" != "" ]]; then
  TEXT=$(echo "${INFO_ARTIST} - ${INFO_TITLE}" |  sed 's/\(.\{45\}\).*/\1.../')
  echo $TEXT $CUR_ICON
  echo ""
  echo $CUR_COL
fi
