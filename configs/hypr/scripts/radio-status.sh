#!/bin/bash
# Radio status for waybar - outputs icon and station name

PIDFILE="/tmp/radio-stream.pid"
STATION_FILE="/tmp/radio-station"

if [ -f "$PIDFILE" ] && kill -0 "$(cat $PIDFILE)" 2>/dev/null; then
	# Playing
	STATION=$(cat "$STATION_FILE" 2>/dev/null || echo "Radio")
	printf '{"text": "󰐹 %s", "class": "on", "tooltip": "Playing: %s\\nClick to stop"}' "$STATION" "$STATION"
else
	# Stopped
	printf '{"text": "󰐸", "class": "off", "tooltip": "Radio - Click to select station"}'
fi
