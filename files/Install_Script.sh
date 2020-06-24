#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
INSTALL_FILES=https://foundryvtt.com/releases/download?version=0.6.4&platform=linux
FVTT_VERSION=0.6.4

echo " "
echo "Server version is ${FVTT_VERSION}."
echo " "

mkdir -p /foundry/fvtt /foundry/data
echo "Downloading and installing FoundryVTT-${FVTT_VERSION}."
echo " "
wget --no-cache ${INSTALL_FILES} -O /ftemp/foundryvtt-${FVTT_VERSION}.zip
sleep 1
unzip -d /foundry/fvtt/ /ftemp/foundryvtt-${FVTT_VERSION}.zip
sleep 1
cp -uR /ftemp/fvtt/. /foundry/fvtt
rm -fr /ftemp/fvtt
rm -fr /ftemp/foundryvtt-${FVTT_VERSION}.zip

sleep 1

# Set permissions.
mkdir -p /foundry/fvtt /foundry/data
chown 99:100 -R /foundry
chmod 776 -R /foundry
chmod +x /foundry/

# Run.
echo " "
echo "INFO ! Starting FoundryVTT-${FVTT_VERSION}"
echo " "
exec node /foundry/fvtt/resources/app/main.js --dataPath=/foundry/data

exit
