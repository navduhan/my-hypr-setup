#!/bin/bash
# -----------------------------------------------------------------------------
# File: install.sh
# Author: Naveen Duhan
# Description: Master installation script for the Professional Hyprland Setup.
#              Handles package installation, backups, and symlinking.
# -----------------------------------------------------------------------------

set -e

# --- Configuration ---
LOG_FILE="install.log"
BACKUP_DIR="${HOME}/.config/hypr_backup_$(date +%Y%m%d_%H%M%S)"
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIGS_DIR="${DOTFILES_DIR}/configs"

# --- Colors ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# --- Functions ---
log() {
    echo -e "${BLUE}[INFO]${NC} $1"
    echo "[INFO] $1" >> "$LOG_FILE"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
    echo "[OK] $1" >> "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    echo "[ERROR] $1" >> "$LOG_FILE"
    exit 1
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
    echo "[WARN] $1" >> "$LOG_FILE"
}

check_aur_helper() {
    if command -v yay &> /dev/null; then
        echo "yay"
    elif command -v paru &> /dev/null; then
        echo "paru"
    else
        echo ""
    fi
}

install_packages() {
    log "Checking for AUR helper..."
    AUR_HELPER=$(check_aur_helper)

    if [ -z "$AUR_HELPER" ]; then
        warn "No AUR helper (yay/paru) found. Attempting to install yay..."
        if ! command -v git &> /dev/null; then
            sudo pacman -S --noconfirm git base-devel
        fi
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm)
        AUR_HELPER="yay"
        rm -rf /tmp/yay
    fi

    log "Using AUR helper: $AUR_HELPER"

    # List of packages to install
    PACKAGES=(
        hyprland
        waybar
        rofi-wayland
        swaync
        swww
        kitty
        dunst # optional backup
        polkit-gnome
        qt5-wayland
        qt6-wayland
        xdg-desktop-portal-hyprland
        grim
        slurp
        wl-clipboard
        ttf-font-awesome
        ttf-jetbrains-mono-nerd
        noto-fonts-emoji
        dolphin # file manager as requested in keybinds
        wlogout
        blueman # bluetooth manager for SwayNC
        network-manager-applet # nm-connection-editor for SwayNC
        libnotify # for notify-send
        brightnessctl # for brightness keys
        playerctl # for media keys
    )

    log "Installing packages..."
    $AUR_HELPER -S --needed --noconfirm "${PACKAGES[@]}"
}


backup_configs() {
    log "Backing up existing configurations to $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"

    for config in hypr waybar rofi swaync kitty wlogout; do
        if [ -d "${HOME}/.config/$config" ]; then
            mv "${HOME}/.config/$config" "$BACKUP_DIR/"
            success "Backed up $config"
        fi
    done
}

link_configs() {
    log "Linking new configurations..."
    
    for config_path in "$CONFIGS_DIR"/*; do
        config_name=$(basename "$config_path")
        target="${HOME}/.config/$config_name"
        
        # Ensure parent dir exists (though .config usually does)
        mkdir -p "${HOME}/.config"
        
        # Remove if it exists (backup already ran, but just in case of re-run artifacts)
        rm -rf "$target"
        
        ln -s "$config_path" "$target"
        success "Linked $config_name -> $target"
    done
}

# --- Main ---
log "Starting installation..."

# 1. Install Packages
install_packages

# 2. Backup
backup_configs

# 3. Symlink
link_configs

log "Installation complete!"
echo -e "${GREEN}Please restart Hyprland or your session to apply changes.${NC}"
