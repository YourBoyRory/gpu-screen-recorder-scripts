#!/bin/bash

echo "notify"

startSplash() {
    yad \
        --no-buttons \
        --splash \
        --on-top \
        --skip-taskbar \
        --undecorated \
        --no-focus \
        --no-escape \
        --timeout=$1 \
        --posx=1920 \
        --posy=1080 \
        --borders=0 \
        --image=$2
}

if [[ "$1" == "start" ]]; then
    startSplash 0 replay-play
elif [[ "$1" == "fail" ]]; then
    startSplash 1 replay-record-error
elif [[ "$1" == "off" ]]; then
    startSplash 0 replay-stop
else
    startSplash 1 replay-record
fi

