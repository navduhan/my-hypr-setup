#!/bin/bash
# -----------------------------------------------------------------------------
# File: theme-switcher.sh
# Author: Naveen Duhan
# Description: Rofi-based theme selector for SwayNC button integration.
# -----------------------------------------------------------------------------

DOTFILES_DIR="$HOME/Documents/my-hypr-setup"
THEMES_DIR="$DOTFILES_DIR/configs/hypr/themes"
SWITCH_SCRIPT="$DOTFILES_DIR/configs/hypr/scripts/switch_theme.sh"

# Get list of available themes
themes=$(ls -1 "$THEMES_DIR" 2>/dev/null)

if [ -z "$themes" ]; then
    notify-send "Theme Switcher" "No themes found in $THEMES_DIR"
    exit 1
fi

# Show Rofi menu
selected=$(echo "$themes" | rofi -dmenu -p "Select Theme" -i -theme-str 'window {width: 400px;}')

if [ -n "$selected" ]; then
    "$SWITCH_SCRIPT" "$selected"
    notify-send "Theme Switcher" "Switched to: $selected"
fi
