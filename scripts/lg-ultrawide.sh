#!/bin/sh
xrandr --newmode "2560x1080_60.00"  230.00  2560 2720 2992 3424  1080 1083 1093 1120 -hsync +vsync
xrandr --addmode HDMI-2 2560x1080_60.00
xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --mode 2560x1080_60.00 --pos 1920x0 --rotate normal

nitrogen --restore
killall conky
start_conky_live_grey
