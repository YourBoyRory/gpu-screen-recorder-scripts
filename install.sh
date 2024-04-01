#!/bin/bash

sudo mkdir /opt/gpu-screen-recorder-scripts/
sudo cp -r ./assets/ /opt/gpu-screen-recorder-scripts/
sudo cp ./save-replay.sh /opt/gpu-screen-recorder-scripts/save-replay.sh
sudo cp ./gui-wrapper.sh /opt/gpu-screen-recorder-scripts/gui-wrapper.sh
sudo cp ./replay-damon.sh /opt/gpu-screen-recorder-scripts/replay-damon.sh
sudo cp ./splash.sh /opt/gpu-screen-recorder-scripts/splash.sh
sudo chmod 755 /opt/gpu-screen-recorder-scripts/assets/
sudo chmod 666 /opt/gpu-screen-recorder-scripts/assets/*
sudo chmod 755 /opt/gpu-screen-recorder-scripts/save-replay.sh
sudo chmod 755 /opt/gpu-screen-recorder-scripts/gui-wrapper.sh
sudo chmod 755 /opt/gpu-screen-recorder-scripts/replay-damon.sh
sudo chmod 755 /opt/gpu-screen-recorder-scripts/splash.sh
