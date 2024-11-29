#!/bin/bash

log "Installing Desktop Environment Components"

# i3 window manager dependencies
sudo apt install -y \
    libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
    libstartup-notification0-dev libxcb-randr0-dev \
    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
    autoconf libxcb-xrm0 libxcb-xrm-dev automake \
    libxcb-shape0-dev pkg-config meson

# Install i3
wget https://i3wm.org/downloads/i3-4.24.tar.xz
tar xf i3-4.24.tar.xz
cd i3-4.24/
mkdir build
cd build
meson ..
ninja
sudo ninja install
cd ../..

# Kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin

# Polybar
sudo apt install -y polybar

# Picom compositor
# Dependencies and installation
sudo apt install -y \
    libconfig-dev libdbus-1-dev libegl-dev libev-dev \
    libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev \
    libx11-xcb-dev libxcb1-dev libxcb-composite0-dev \
    libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev \
    libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev \
    libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev \
    libxcb-xfixes0-dev meson ninja-build uthash-dev

git clone https://github.com/pijulius/picom.git
cd picom
meson setup build
ninja -C build
sudo ninja -C build install
cd ..

# Rofi
sudo apt install -y \
    git meson ninja-build gcc g++ \
    libxkbcommon-dev libxkbcommon-x11-dev \
    libx11-dev libxcb1-dev libxcb-xkb-dev \
    libxcb-randr0-dev libxcb-ewmh-dev \
    libxcb-icccm4-dev libxcb-xrm-dev \
    libxcb-cursor-dev libxcb-util-dev libxcb-util0-dev

git clone https://github.com/davatorium/rofi.git
cd rofi
meson setup build
meson compile -C build
sudo meson install -C build
cd ..

# Appearance
sudo apt install -y lxappearance

# Autotiling
pip install autotiling
