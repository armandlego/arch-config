#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

echo "$(date '+%F, %H-%M-%S'), $(i3-msg -t get_tree | jq -r 'recurse(.nodes[];.nodes!=null)|select(.nodes[].focused).nodes | .[] | select(.focused).window_properties.class')" >> $HOME/.ActivityLog.csv

echo ""
echo saving
echo $YELLOW
exit
