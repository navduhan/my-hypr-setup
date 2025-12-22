#!/bin/bash
# -----------------------------------------------------------------------------
# File: configs/hypr/scripts/test_fingerprint.sh
# Description: Diagnoses fingerprint scanner issues.
# -----------------------------------------------------------------------------

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== Fingerprint Diagnostic Tool ===${NC}"

# 1. Check if fprintd is installed
if ! command -v fprintd-verify &> /dev/null; then
    echo -e "${RED}[ERROR] fprintd is NOT installed.${NC}"
    exit 1
fi
echo -e "${GREEN}[OK] fprintd is installed.${NC}"

# 2. Check Service Status
echo "Checking fprintd service status..."
if systemctl is-active --quiet fprintd; then
    echo -e "${GREEN}[OK] fprintd service is running.${NC}"
else
    echo -e "${RED}[WARN] fprintd service is NOT running. Attempting to start...${NC}"
    sudo systemctl start fprintd
fi

# 3. List Devices
echo "Looking for fingerprint devices..."
DEVICES=$(fprintd-list "$USER")
echo "$DEVICES"

if echo "$DEVICES" | grep -q "No devices available"; then
    echo -e "${RED}[ERROR] No fingerprint reader detected!${NC}"
    echo "This means Linux does not see your hardware."
    echo "Possible reasons:"
    echo "  - Driver missing (some newer sensors need specific drivers like libfprint-2-tod1)"
    echo "  - Hardware switch disabled in BIOS"
    echo "Check 'lsusb' output below for any 'Fingerprint' or 'Sensor' devices:"
    lsusb
    exit 1
fi

# 4. Verification Test
echo ""
echo -e "${GREEN}=== Testing Verification ===${NC}"
echo "We will now try to verify your finger."
echo "Please swipe/touch your sensor when you see 'Verify result'..."
fprintd-verify

echo ""
echo "Diagnostic complete."
