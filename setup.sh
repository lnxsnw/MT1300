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
cp -r /tmp/MT1300-3/etc/* /etc/
cp -r /tmp/MT1300-3/usr/* /usr/
cp -r /tmp/MT1300-3/www/* /www/ 2>/dev/null || true
chmod +x /etc/init.d/adguardhome
/etc/init.d/adguardhome enable
echo
echo "Setup completed!"
echo "Rebooting in 10 Seconds..."
echo "CTRL+C to cancel."
sleep 10
reboot