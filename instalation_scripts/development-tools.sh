#!/bin/bash

log "Installing Development Tools"

# Install Rig for R
curl -Ls https://github.com/r-lib/rig/releases/download/v0.7.0/rig-linux-0.7.0.tar.gz | sudo tar xz -C /usr/local
sudo apt update

# Configure environment for R
echo 'export RIG_PLATFORM="ubuntu-22.04"' >> ~/.bashrc
source ~/.bashrc

# Install latest R version
sudo -E rig install

# Install Node.js via NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 18
nvm use 18
nvm alias default 18

# Build Neovim from source
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
rm -rf neovim

# Additional Neovim dependencies
sudo apt-get install -y \
    texlive-full \
    luarocks \
    libreadline-dev
