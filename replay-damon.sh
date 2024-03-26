#!/bin/bash

SCRIPT_DIR=/opt/gpu-screen-recorder-scripts/splash.sh
ps aux | grep '[g]pu-screen-recorder ' >> /dev/null
exitcode=$?
lastChange=2

testBreak() {
    if [[ "$1" == "-x" ]]; then
        ps aux | grep '[g]pu-screen-recorder-gtk$' >> /dev/null
        out=$?
        if [[ $out -ne 0 ]]; then
            return 1
        fi
    fi
    return 0
}

while testBreak $1; do
    sleep 1
    if [[ $exitcode -eq 0 && $lastChange -ne 0 ]]; then
        pkill -TERM -P $proc
        lastChange=$exitcode
        $SCRIPT_DIR start &
        proc=$!
    elif [[ $exitcode -eq 1 && $lastChange -ne 1 ]]; then
        pkill -TERM -P $proc
        lastChange=$exitcode
        #$SCRIPT_DIR off &
        #proc=$!
    fi
    ps aux | grep -w '[g]pu-screen-recorder ' >> /dev/null
    exitcode=$?
done
pkill -TERM -P $proc
