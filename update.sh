#!/bin/sh

# Check if URL parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <AdGuardHome_download_url>"
    echo "Example: $0 https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.55/AdGuardHome_linux_mipsle_softfloat.tar.gz"
    exit 1
fi

# Download URL
DOWNLOAD_URL="$1"

echo "Downloading AdGuardHome..."
wget "$DOWNLOAD_URL" -O /tmp/a.tar.gz

if [ $? -ne 0 ]; then
    echo "Failed to download AdGuardHome"
    exit 1
fi

echo "Extracting archive..."
cd /tmp
tar -xvzf a.tar.gz

if [ $? -ne 0 ]; then
    echo "Failed to extract archive"
    rm -f /tmp/a.tar.gz
    exit 1
fi

echo "Waiting 3 seconds..."
sleep 3

echo "Copying AdGuardHome binary..."

# Get the script's directory
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

if ! cp /tmp/AdGuardHome/AdGuardHome "$SCRIPT_DIR/AdGuardHome.new"; then

    echo "Failed to copy AdGuardHome binary"

    rm -f /tmp/a.tar.gz

    rm -rf /tmp/AdGuardHome

    exit 1

fi

if [ $? -ne 0 ]; then
    echo "Failed to copy AdGuardHome binary"
    rm -f /tmp/a.tar.gz
    rm -rf /tmp/AdGuardHome
    exit 1
fi

echo "AdGuardHome.new has been created in the current directory"
echo "Waiting 10 seconds before cleanup..."
sleep 10

echo "Cleaning up temporary files..."
rm -f /tmp/a.tar.gz
rm -rf /tmp/AdGuardHome

echo "Update completed successfully!"
