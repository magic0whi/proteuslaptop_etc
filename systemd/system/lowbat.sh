#!/bin/sh
status=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$status" = "Discharging" -a "$capacity" -lt 10 ]; then
    logger "Critical battery threshold"
    systemctl hibernate
fi
