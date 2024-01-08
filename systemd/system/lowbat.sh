#!/bin/sh
status=$(< /sys/class/power_supply/BAT0/status)
capacity=$(< /sys/class/power_supply/BAT0/capacity)

if [ "$status" = "Discharging" -a "$capacity" -lt 10 ]; then
    logger "Critical battery threshold"
    systemctl hibernate
fi
