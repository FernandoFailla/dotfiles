#!/bin/bash

log "Installing Applications"

# Quarto
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.33/quarto-1.6.33-linux-amd64.deb
sudo apt install -y ./quarto-1.6.33-linux-amd64.deb

# Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.5/obsidian_1.7.5_amd64.deb
sudo apt install -y ./obsidian_1.7.5_amd64.deb

# Vesktop (Discord client)
wget https://vencord.dev/download/vesktop/amd64/deb
sudo apt install -y ./vesktop_1.5.3_amd64.deb

# OBS Studio
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt install -y obs-studio

# Syncthing
sudo apt install -y syncthing

# Additional utilities
sudo apt install -y \
    thunar \
    zathura \
    arandr

# Yazi file manager
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install --locked yazi-fm
