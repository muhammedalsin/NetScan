#!/bin/bash

if [ "$1" == "--help" ]; then
    echo "This tool for discovering hosts in the network. If you want to run this tool, please type ./NetScan --run"
    exit 0
fi

if [ "$1" == "--run" ]; then
    ip=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}' | cut -d "." -f 1,2,3)
    octet=1
    echo "NetScan is running ..."
    while [ $octet -lt 255 ]; do
        ipv4=$(ping -c 1 $ip.$octet | grep ttl | awk '{print $4}' | sed 's/://')
        if [ ! -z "$ipv4" ]; then
            echo "               Host Found, IP: $ipv4"
        fi
        octet=$(($octet + 1))
    done
fi
