#!/bin/bash
# -----------------------------------------------------------------------------
# File: monitor-menu.sh
# Author: Naveen Duhan
# Description: Rofi menu for monitor management (mirror/extend/disconnect).
# -----------------------------------------------------------------------------

CHOICE=$(echo -e "🖥️ Extend Right\n🖥️ Extend Left\n🖥️ Extend Above\n🪞 Mirror\n📺 External Only\n💻 Laptop Only" | rofi -dmenu -p "Monitor" -theme-str 'window {width: 300px;}')

# Get monitor names
PRIMARY=$(hyprctl monitors -j | jq -r '.[0].name')
SECONDARY=$(hyprctl monitors -j | jq -r '.[1].name // empty')

# Detect if external monitor is available
EXTERNAL=$(hyprctl monitors -j | jq -r '.[] | select(.name != "eDP-1") | .name' | head -n1)

case "$CHOICE" in
    "🖥️ Extend Right")
        if [ -n "$EXTERNAL" ]; then
            hyprctl keyword monitor "$EXTERNAL,preferred,auto,1"
        else
            notify-send "No external monitor detected"
        fi
        ;;
    "🖥️ Extend Left")
        if [ -n "$EXTERNAL" ]; then
            hyprctl keyword monitor "$EXTERNAL,preferred,auto-left,1"
        else
            notify-send "No external monitor detected"
        fi
        ;;
    "🖥️ Extend Above")
        if [ -n "$EXTERNAL" ]; then
            hyprctl keyword monitor "$EXTERNAL,preferred,0x-1080,1"
        else
            notify-send "No external monitor detected"
        fi
        ;;
    "🪞 Mirror")
        if [ -n "$EXTERNAL" ]; then
            hyprctl keyword monitor "$EXTERNAL,preferred,auto,1,mirror,eDP-1"
        else
            notify-send "No external monitor detected"
        fi
        ;;
    "📺 External Only")
        if [ -n "$EXTERNAL" ]; then
            hyprctl keyword monitor "eDP-1,disable"
        else
            notify-send "No external monitor detected"
        fi
        ;;
    "💻 Laptop Only")
        hyprctl keyword monitor "eDP-1,preferred,auto,auto"
        if [ -n "$EXTERNAL" ]; then
            hyprctl keyword monitor "$EXTERNAL,disable"
        fi
        ;;
esac
