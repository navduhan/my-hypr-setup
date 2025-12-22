#!/bin/bash
# -----------------------------------------------------------------------------
# File: scripts/enable_fingerprint.sh
# Description: Enables fingerprint authentication for Hyprlock by modifying PAM.
# -----------------------------------------------------------------------------

set -e

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[INFO] Setting up fingerprint scanner...${NC}"

# 1. Ensure fprintd is installed
if ! command -v fprintd-enroll &> /dev/null; then
    echo "Installing fprintd..."
    if command -v yay &> /dev/null; then
        yay -S --needed --noconfirm fprintd
    elif command -v paru &> /dev/null; then
        paru -S --needed --noconfirm fprintd
    else
        sudo pacman -S --needed --noconfirm fprintd
    fi
fi

# 2. Verify/Enroll Fingerprint (CRITICAL STEP)
# We must ensure a fingerprint is actually enrolled BEFORE enabling PAM,
# otherwise hyprlock might hang or fail.
echo "Verifying fingerprint enrollment..."
if ! fprintd-list "$USER" 2>/dev/null | grep -q "finger"; then
    echo "No fingerprints found. Enrolling now..."
    echo "Please swipe your finger on the scanner..."
    if ! fprintd-enroll; then
        echo -e "${RED}[ERROR] Enrollment failed or cancelled.${NC}"
        echo "Aborting PAM configuration to prevent system lockout."
        exit 1
    fi
else
    echo "Fingerprints already enrolled. Skipping enrollment."
fi

# 3. Enable fprintd service
echo "Enabling fprintd service..."
sudo systemctl enable --now fprintd

# 3. Modify /etc/pam.d/hyprlock
# We need to add "auth sufficient pam_fprintd.so" specific to Hyprlock
PAM_FILE="/etc/pam.d/hyprlock"

echo "Configuring PAM for hyprlock..."

    # Create or Overwrite with clean config (system-auth is better than login for lockers)
    echo "Writing clean PAM config to $PAM_FILE..."
    # Backup existing if not already backed up
    if [ ! -f "${PAM_FILE}.bak" ]; then
        sudo cp "$PAM_FILE" "${PAM_FILE}.bak"
    fi
    
    sudo bash -c "cat > $PAM_FILE <<EOF
auth        sufficient    pam_fprintd.so
auth        include       system-auth
account     include       system-auth
password    include       system-auth
session     include       system-auth
EOF"

echo -e "${GREEN}[OK] Fingerprint setup complete!${NC}"
echo -e "${GREEN}[OK] Hyprlock PAM configured.${NC}"

# 4. Modify /etc/pam.d/sddm
SDDM_PAM="/etc/pam.d/sddm"
echo "Configuring PAM for SDDM..."

if [ -f "$SDDM_PAM" ]; then
   if grep -q "pam_fprintd.so" "$SDDM_PAM"; then
       echo "Fingerprint already configured in $SDDM_PAM."
   else
       echo "Adding pam_fprintd.so to $SDDM_PAM..."
       # Backup
       sudo cp "$SDDM_PAM" "${SDDM_PAM}.bak"
       # Add sufficient auth at the very top (safest for SDDM)
       sudo sed -i '1i auth        sufficient    pam_fprintd.so' "$SDDM_PAM"
   fi
else
   echo "$SDDM_PAM not found. Skipping SDDM PAM config."
fi

# 5. Configure SDDM [Fingerprintlogin] for enter-less login (Experimental)
# Note: Requires SDDM 0.20+ or git, may disable password fallback!
echo "Configuring SDDM Fingerprintlogin..."
SDDM_CONF_DIR="/etc/sddm.conf.d"
SDDM_FP_CONF="$SDDM_CONF_DIR/fingerprint.conf"

if [ ! -d "$SDDM_CONF_DIR" ]; then
    echo "Creating $SDDM_CONF_DIR..."
    sudo mkdir -p "$SDDM_CONF_DIR"
fi

echo "Writing $SDDM_FP_CONF..."
sudo bash -c "cat > $SDDM_FP_CONF <<EOF
[Fingerprintlogin]
User=$USER
Session=hyprland
EOF"

echo -e "${GREEN}[OK] Fingerprint setup complete (Hyprlock + SDDM + AutoLogin)!${NC}"
