#!/bin/bash
# -----------------------------------------------------------------------------
# File: spotify-menu.sh
# Author: Naveen Duhan
# Description: Spotify controls and search via rofi
# -----------------------------------------------------------------------------

# Check if spotify_player or spotifyd is running
check_spotify() {
    playerctl -l 2>/dev/null | grep -qE "spotify|spotifyd" && return 0
    return 1
}

# Get current track info
get_current_track() {
    if check_spotify; then
        artist=$(playerctl -p spotify_player,spotifyd metadata artist 2>/dev/null)
        title=$(playerctl -p spotify_player,spotifyd metadata title 2>/dev/null)
        if [ -n "$artist" ] && [ -n "$title" ]; then
            echo "$artist - $title"
        else
            echo "No track playing"
        fi
    else
        echo "Spotify not running"
    fi
}

# Build menu options
build_menu() {
    echo "  Open Spotify"
    echo "  Search..."
    if check_spotify; then
        status=$(playerctl -p spotify_player,spotifyd status 2>/dev/null)
        if [ "$status" = "Playing" ]; then
            echo "  Pause"
        else
            echo "  Play"
        fi
        echo "  Next"
        echo "  Previous"
        echo "  Current: $(get_current_track)"
    fi
}

# Handle search
do_search() {
    query=$(rofi -dmenu -p "Search Spotify" -theme-str 'window {width: 400px;}')
    if [ -n "$query" ]; then
        # Open spotify_player with search query
        foot -e bash -c "spotify_player search '$query'; read -p 'Press Enter to close...'"
    fi
}

# Show menu
CHOICE=$(build_menu | rofi -dmenu -p "Spotify" -theme-str 'window {width: 300px;}')

case "$CHOICE" in
    *"Open Spotify"*)
        foot -e spotify_player &
        ;;
    *"Search"*)
        do_search
        ;;
    *"Pause"* | *"Play"*)
        playerctl -p spotify_player,spotifyd play-pause
        ;;
    *"Next"*)
        playerctl -p spotify_player,spotifyd next
        ;;
    *"Previous"*)
        playerctl -p spotify_player,spotifyd previous
        ;;
esac
