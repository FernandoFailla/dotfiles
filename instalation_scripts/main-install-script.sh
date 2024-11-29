#!/bin/bash

# Exit on any error
set -e

# Function to log steps
log() {
    echo "=== $1 ==="
}

# Update system first
log "Updating System"
sudo apt update
sudo apt upgrade -y

# Source other installation scripts
source ./system-dependencies.sh
source ./development-tools.sh
source ./desktop-environment.sh
source ./applications.sh
source ./configuration.sh

log "Installation Complete!"
echo "Please reboot your system to apply all changes."
