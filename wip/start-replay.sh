#!/bin/bash

#SCRIPT_DIR=$(dirname "$0")./splash.sh
#echo $SCRIPT_DIR
echo $$

sh ../splash.sh start &
child=$!

video_path="$HOME/Videos/$1"
mkdir -p "$video_path"

gpu-screen-recorder \
    -w focused \
    -s 1920x1080 \
    -f 60 \
    -a "$(pactl get-default-sink).monitor" \
    -a "$(pactl get-default-source)" \
    -c mp4 \
    -r 30 \
    -o "$video_path" \

pkill -TERM -P $child
