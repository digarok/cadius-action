#!/bin/sh

CADZIP=https://github.com/digarok/cadius/releases/download/0.0.0/cadius-ubuntu-latest-0.0.0.zip

curl -L $CADZIP -o cadius.zip
unzip cadius.zip
mv cadius /usr/bin

cadius createvolume $INPUT_VOLUME_PATH $INPUT_VOLUME_NAME $INPUT_VOLUME_SIZE

if [ "$INPUT_INCLUDE_PRODOS" == true ]; then
    echo "Grabbing ProDOS 2.4.2"
    curl -L https://mirrors.apple2.org.za/ftp.apple.asimov.net/images/masters/prodos/ProDOS_2_4_2.dsk ProDOS_2_4_2.dsk
    git clone https://github.com/digarok/dsk2po.git
    python3 dsk2po.py ProDOS_2_4_2.dsk
    cadius extractfile ProDOS_2_4_2.po /PRODOS.2.4.2/PRODOS  .
    cadius extractfile ProDOS_2_4_2.po /PRODOS.2.4.2/BASIC.SYSTEM  .
fi

