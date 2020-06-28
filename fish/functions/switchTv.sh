#!/bin/sh
xrandr --output LVDS1 --off --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off
pactl set-card-profile 0 output:hdmi-stereo
