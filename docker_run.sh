#!/bin/bash
# Docker run script

export LIDAR_IP_ADDRESS=$(avahi-resolve-host-name -4 os1-992005000477.local | awk '{print $2}')
export XAVIER_IP=$(ip addr show enp0s31f6 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1) #change enp0s31f6 to lidar interface (its enp0s31f6 on lenovo)

docker compose up