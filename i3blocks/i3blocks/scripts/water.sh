#! /usr/bin/env bash

source $(dirname $0)/../colors.sh

if [ $button ] 
then
    echo ""
    echo ""
    echo ""
    exit
else 
    echo -e "\uf7b6"
    echo "Drink!"
    echo $BLUE
fi
