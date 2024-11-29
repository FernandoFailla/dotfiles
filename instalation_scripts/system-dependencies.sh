#!/bin/bash

log "Installing System Dependencies"
sudo apt-get update && sudo apt-get install -y \
    sudo \
    build-essential \
    curl \
    make \
    neofetch \
    stow \
    git \
    wget \
    gnupg \
    software-properties-common \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    python3-pip \
    python3-dev \
    python3-venv \
    lua5.1 \
    liblua5.1-dev \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    nodejs \
    npm \
    pkg-config \
    unzip \
    tmux \
    libmagickwand-dev \
    zsh
