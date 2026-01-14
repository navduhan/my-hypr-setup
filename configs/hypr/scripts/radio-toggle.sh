#!/bin/bash
# -----------------------------------------------------------------------------
# File: radio-toggle.sh
# Author: Naveen Duhan
# Description: Toggle radio stream playback with multiple Hindi stations
# -----------------------------------------------------------------------------

PIDFILE="/tmp/radio-stream.pid"
STATION_FILE="/tmp/radio-station"

# Stations
declare -A STATIONS
STATIONS["Vividh Bharti"]="http://air.pc.cdn.bitgravity.com/air/live/pbaudio001/playlist.m3u8"
STATIONS["Radio Aashiqanaa"]="https://sonic.onlineaudience.co.uk/8114/stream"
STATIONS["90s Bollywood"]="https://stream.zeno.fm/rm4i9pdex3cuv"
STATIONS["Mohammed Rafi"]="https://stream.zeno.fm/6yqvumgfxtzuv"
STATIONS["Bollywood 2000s"]="https://2.mystreaming.net/uber/bollywood2000s/icecast.audio"
STATIONS["Red FM 93.5"]="https://stream-174.zeno.fm/q97eczydqrhvv"

stop_radio() {
	if [ -f "$PIDFILE" ] && kill -0 "$(cat $PIDFILE)" 2>/dev/null; then
		kill "$(cat $PIDFILE)" 2>/dev/null
		rm -f "$PIDFILE" "$STATION_FILE"
		notify-send "Radio" "Stopped" -t 2000
	fi
}

play_radio() {
	local url="$1"
	local name="$2"
	stop_radio
	mpv --no-video "$url" &
	echo $! >"$PIDFILE"
	echo "$name" >"$STATION_FILE"
	notify-send "Radio" "Playing $name" -t 2000
}

# If radio is playing, stop it. Otherwise show menu.
if [ -f "$PIDFILE" ] && kill -0 "$(cat $PIDFILE)" 2>/dev/null; then
	stop_radio
else
	# Build menu from stations
	MENU=$(printf '%s\n' "${!STATIONS[@]}" | sort)
	CHOICE=$(echo "$MENU" | rofi -dmenu -p "Select Radio" -theme-str 'window {width: 300px;}')

	if [ -n "$CHOICE" ] && [ -n "${STATIONS[$CHOICE]}" ]; then
		play_radio "${STATIONS[$CHOICE]}" "$CHOICE"
	fi
fi
