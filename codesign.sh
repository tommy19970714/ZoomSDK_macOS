#!/bin/sh

# How to run
# ./codesign.sh "Apple Development: Developer Name"

filenames=("airhost.app" "capHost.app" "aomhost.app" "CptHost.app" "SDK_Transcode.app")

for filename in "${filenames[@]}"
do
    codesign --force --verify --verbose --sign "$1" "./ZoomSDK/$filename" --deep --options runtime --timestamp
done
