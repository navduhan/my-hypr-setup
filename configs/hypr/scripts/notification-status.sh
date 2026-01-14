#!/bin/bash
# Notification status for waybar

COUNT=$(swaync-client -c 2>/dev/null || echo "0")
DND=$(swaync-client -D 2>/dev/null || echo "false")

if [ "$DND" = "true" ]; then
	if [ "$COUNT" -gt 0 ]; then
		printf '{"text": "", "class": "dnd-notification", "tooltip": "Do Not Disturb - %s notifications"}' "$COUNT"
	else
		printf '{"text": "", "class": "dnd", "tooltip": "Do Not Disturb"}'
	fi
else
	if [ "$COUNT" -gt 0 ]; then
		printf '{"text": "", "class": "notification", "tooltip": "%s notifications"}' "$COUNT"
	else
		printf '{"text": "", "class": "none", "tooltip": "No notifications"}'
	fi
fi
