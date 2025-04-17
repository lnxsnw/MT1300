#!/bin/sh

# Function to handle paths with spaces
handle_path() {
    # Remove surrounding quotes if present
    local path="${1%\"}"
    path="${path#\"}"
    echo "$path"
}

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# Copy directories
echo
echo
echo
sleep 5
cp -r /tmp/MT1300-2/etc/* /etc/
cp -r /tmp/MT1300-2/usr/* /usr/
cp -r /tmp/MT1300-2/www/* /www/ 2>/dev/null || true
chmod +x /etc/init.d/adguardhome
/etc/init.d/adguardhome enable
# Prompt the user for the desired directory
echo "Enter the directory path for your locally stored AdGuardHome (default: /mnt/sdcard/AdGuardHome): "
read user_input

# Remove any quotation marks from the input
user_input=$(echo "$user_input" | sed 's/["]//g')

# Set default value if no input is given
if [ -z "$user_input" ]; then
    AGH_LOCAL_DIR="/mnt/sdcard/AdGuardHome"
else
    AGH_LOCAL_DIR="$user_input"
fi

# Now, update the /etc/init.d/adguardhome file
sed -i "s|AGH_LOCAL_DIR=.*|AGH_LOCAL_DIR=\"$AGH_LOCAL_DIR\"|" /etc/init.d/adguardhome
echo "AGH_LOCAL_DIR has been set to: $AGH_LOCAL_DIR"

echo
echo "Setup completed!"
echo
