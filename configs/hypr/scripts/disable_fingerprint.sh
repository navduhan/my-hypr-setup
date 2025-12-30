#!/bin/bash
# -----------------------------------------------------------------------------
# File: scripts/disable_fingerprint.sh
# Description: Disables fingerprint authentication for Hyprlock to fix lockout issues.
# -----------------------------------------------------------------------------

set -e

GREEN='\033[0;32m'
NC='\033[0m'

PAM_FILE="/etc/pam.d/hyprlock"

echo -e "${GREEN}[INFO] Restoring Hyprlock PAM configuration...${NC}"

if [ -f "$PAM_FILE" ]; then
    # Remove the line containing pam_fprintd.so
    if grep -q "pam_fprintd.so" "$PAM_FILE"; then
        echo "Removing fingerprint module from $PAM_FILE..."
        sudo sed -i '/pam_fprintd.so/d' "$PAM_FILE"
        echo -e "${GREEN}[OK] Fingerprint disabled.${NC}"
    else
        echo "Fingerprint module not found in $PAM_FILE. Nothing to do."
    fi
else
    echo "PAM file $PAM_FILE does not exist."
fi

# Clean up SDDM configuration
SDDM_PAM="/etc/pam.d/sddm"
if [ -f "$SDDM_PAM" ]; then
    if grep -q "pam_fprintd.so" "$SDDM_PAM"; then
        echo "Removing fingerprint module from $SDDM_PAM..."
        sudo sed -i '/pam_fprintd.so/d' "$SDDM_PAM"
        echo -e "${GREEN}[OK] SDDM Fingerprint disabled.${NC}"
    fi
fi

# Remove SDDM fingerprint config file
SDDM_FP_CONF="/etc/sddm.conf.d/fingerprint.conf"
if [ -f "$SDDM_FP_CONF" ]; then
    echo "Removing $SDDM_FP_CONF..."
    sudo rm "$SDDM_FP_CONF"
    echo -e "${GREEN}[OK] SDDM Fingerprint auto-login config removed.${NC}"
fi

echo ""
echo "Please try locking and unlocking with your PASSWORD now."
echo "If it still hangs, you may need to 'cat /etc/pam.d/system-auth' to ensure it is valid."
