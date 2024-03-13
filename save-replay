#!/bin/bash

SCRIPT_DIR=/opt/gpu-screen-recorder-scripts/splash.sh

killall -SIGUSR1 gpu-screen-recorder
exitcode=$?
if [[ $exitcode -ne 0 ]]; then
    $SCRIPT_DIR fail
else
    $SCRIPT_DIR saved
fi
