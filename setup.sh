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
echo "Copying directories to system..."
cp -r /tmp/MT1300-main/etc/* /etc/
cp -r /tmp/MT1300-main/usr/* /usr/
cp -r /tmp/MT1300-main/www/* /www/ 2>/dev/null || true
echo "File Transfer Tasks Done, Cooling Down for 3 Seconds..."
sleep 3

# Create required directories
echo "Creating required directories..."
mkdir -p /etc/AdGuardHome

# Make adguardhome script executable
chmod +x /etc/init.d/adguardhome

# Enable adguardhome service
/etc/init.d/adguardhome enable

# Ask for AdGuardHome directory
echo
echo "Please enter the path to your AdGuardHome directory (where the AdGuardHome binary resides):"
read -r AGH_DIR

# Handle the path (remove quotes if present)
AGH_DIR=$(handle_path "$AGH_DIR")

# Create symbolic links
ln -s "$AGH_DIR" "/etc/AdGuardHome"
ln -s "/etc/AdGuardHome/AdGuardHome" "/usr/bin/AdGuardHome"

# Make AdGuardHome binary executable
chmod +x /usr/bin/AdGuardHome/AdGuardHome

# Remind user to edit init.d script
echo
echo "IMPORTANT: Please edit /etc/init.d/adguardhome to update the following variables:"
echo "- MOUNT_NAME"
echo "- AGH_DIRECTORY"
echo
echo "The script will continue in 3 seconds..."
sleep 3

echo
echo "Setup completed!"
echo "You may now access AdGuardHome through the GL.iNet interface."
echo "Do not forget to edit the /etc/init.d/adguardhome file."
