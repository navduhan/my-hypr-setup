#!/bin/bash
# -----------------------------------------------------------------------------
# File: switch_theme.sh
# Author: Naveen Duhan
# Description: Switches the active system theme.
#              Updates Hyprland, Waybar, Rofi, and GTK settings.
# -----------------------------------------------------------------------------

THEME="$1"
DOTFILES_DIR="$HOME/Documents/my-hypr-setup"
CONFIGS_DIR="$DOTFILES_DIR/configs"

if [ -z "$THEME" ]; then
    echo "Usage: $0 <theme_name>"
    echo "Available themes:"
    ls "$CONFIGS_DIR/hypr/themes"
    exit 1
fi

THEME_DIR="$CONFIGS_DIR/hypr/themes/$THEME"

if [ ! -d "$THEME_DIR" ]; then
    echo "Error: Theme '$THEME' not found in $CONFIGS_DIR/hypr/themes/"
    exit 1
fi

echo "Switching to theme: $THEME"

# 1. Hyprland: Link theme.conf
ln -sf "$THEME_DIR/theme.conf" "$HOME/.config/hypr/theme.conf"

# 2. Waybar: Link style.css
# Assuming each theme has a waybar.css or we generate one. 
# For now, let's assume valid themes have a 'waybar.css' inside.
if [ -f "$THEME_DIR/waybar.css" ]; then
    ln -sf "$THEME_DIR/waybar.css" "$HOME/.config/waybar/style.css"
fi

# 3. Rofi: Link theme.rasi
if [ -f "$THEME_DIR/rofi.rasi" ]; then
    ln -sf "$THEME_DIR/rofi.rasi" "$HOME/.config/rofi/theme.rasi"
fi

# 4. Kitty: Link theme.conf
if [ -f "$THEME_DIR/kitty.conf" ]; then
    ln -sf "$THEME_DIR/kitty.conf" "$HOME/.config/kitty/theme.conf"
    # Reload Kitty if running
    killall -SIGUSR1 kitty 2>/dev/null
fi

# 5. Wlogout: Link layout and style.css
# Handle case where .config/wlogout is a symlink to the repo dir (from install.sh)
if [ -L "$HOME/.config/wlogout" ]; then
    rm "$HOME/.config/wlogout"
    mkdir -p "$HOME/.config/wlogout"
fi
mkdir -p "$HOME/.config/wlogout"

ln -sf "$CONFIGS_DIR/wlogout/layout" "$HOME/.config/wlogout/layout"

if [ -f "$THEME_DIR/wlogout.css" ]; then
    ln -sf "$THEME_DIR/wlogout.css" "$HOME/.config/wlogout/style.css"
fi

# 6. Hyprlock: Link theme file
if [ -f "$THEME_DIR/hyprlock.conf" ]; then
    ln -sf "$THEME_DIR/hyprlock.conf" "$HOME/.config/hypr/hyprlock-theme.conf"
fi

# 4. Wallpaper (swww)
# Look for a wallpaper file in the theme dir
WALLPAPER=$(find "$THEME_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | head -n 1)
if [ -n "$WALLPAPER" ]; then
    echo "Applying wallpaper: $WALLPAPER"
    swww img "$WALLPAPER" --transition-type grow --transition-pos 0.925,0.977 --transition-step 90 --transition-fps 60
fi

# 5. Reload Apps
echo "Reloading Hyprland..."
hyprctl reload

echo "Reloading Waybar..."
pkill waybar
waybar & disown

echo "Reloading SwayNC..."
swaync-client -R
swaync-client -rs

echo "Theme switched successfully!"
