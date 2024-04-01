#!/bin/bash

icon_dir="/opt/gpu-screen-recorder-scripts/assets"

display=$(grep -oP '^main.record_area_option \K.*' ~/.config/gpu-screen-recorder/config)
posx=$(xrandr --verbose | grep $display | cut -d'+' -f2)
posy=$(xrandr --verbose | grep $display | grep -oP '\d+x1080' | awk -F'x' '{print $2}')
if [[ "$posx" == "" || "$posy" == "" ]]; then
    display=$(xrandr --verbose | grep 'primary' | cut -d' ' -f1)
    posx=$(xrandr --verbose | grep $display | cut -d'+' -f2)
    posy=$(xrandr --verbose | grep $display | grep -oP '\d+x1080' | awk -F'x' '{print $2}')
fi

# Uncomment these out if tou want to specify your own location
# posx=0
 posy=0


startSplash() {
    GDK_BACKEND=x11 yad \
        --no-buttons \
        --on-top \
        --skip-taskbar \
        --undecorated \
        --no-focus \
        --no-escape \
        --timeout=$1 \
        --posx=$posx \
        --posy=$posy \
        --borders=0 \
        --image=$icon_dir/$2.png
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

