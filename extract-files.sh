#!/bin/bash

VENDOR=asus
DEVICE=tilapia

BASE=$VENDOR/$DEVICE/proprietary
if [ -d $BASE ]; then
    rm -rf $BASE/*
else
    mkdir -p $BASE
fi

for FILE in `cat proprietary-blobs.txt | grep -v "^#" | sed -e 's#^/system/##g'`; do
    cp ./rom/system/$FILE $BASE/
done

./setup-makefiles.sh
