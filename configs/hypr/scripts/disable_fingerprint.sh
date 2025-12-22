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

echo ""
echo "Please try locking and unlocking with your PASSWORD now."
echo "If it still hangs, you may need to 'cat /etc/pam.d/system-auth' to ensure it is valid."
