#! /usr/bin/env bash

source $(dirname $0)/../colors.sh


CUR_T1=$(sensors | grep "temp1" | grep -o -E "[\+\-]?[0-9]*.[0-9]*°C" | sed -n '1p' | tr -d '+°C')
CUR_T2=$(sensors | grep "temp2" | grep -o -E "[\+\-]?[0-9]*.[0-9]*°C" | sed -n '1p' | tr -d '+°C')

CUR_T1=${CUR_T1%.*}
CUR_T2=${CUR_T2%.*}

echo " $CUR_T1°C"
echo "perf"
if [ $CUR_T1 -ge 80 || $CUR_T2 -ge 80 ]
then
        echo $RED
fi

if [ $button ]
then
    i3-sensible-terminal -e btm
fi
