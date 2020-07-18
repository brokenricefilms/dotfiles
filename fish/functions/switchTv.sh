#!/bin/sh
xrandr --output XWAYLAND1 --mode 1920x1080 --pos 0x0 --rotate normal --output XWAYLAND3 --off
pactl set-card-profile 0 output:hdmi-stereo
