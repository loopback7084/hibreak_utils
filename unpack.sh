#!/bin/bash

if [ $# != "1" ]
then
    echo "Unpack: Filename"
    exit 0
fi

rm -f ./system_a.img
rm -f ./vendor_a.img
rm -f ./product_a.img

lpunpack --slot=0 $1
