#!/bin/sh
wpctl set-default $(wpctl status -n | awk 'BEGIN { A=0; S=0; } /^Audio/ { A=1; } /Sinks/ { S=1; } /Sources/ { S=0; } { if (A==1 && S==1 && /[[:digit:]]+\./) { print; } }' | sed 's/^.* \([[:digit:]]*\)\. \([[:alnum:]_.-]*\).*$/\1\t\2/' | awk '/bluez_output/ { print $1; }')
