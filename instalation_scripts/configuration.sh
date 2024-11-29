#!/bin/bash

log "Configuring System"

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# TODO: Add Powerlevel10k installation
# TODO: Clone personal configurations from GitHub

# Configure Syncthing as a service
systemctl enable syncthing@$USER
systemctl start syncthing@$USER
