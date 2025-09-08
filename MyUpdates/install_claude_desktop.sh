#!/bin/bash

# Update and install dependencies
sudo apt update
sudo apt install -y nodejs npm git

# Install electron-builder globally
sudo npm install -g electron-builder

# Clone the repository
git clone https://github.com/aaddrick/claude-desktop-debian.git
cd claude-desktop-debian

# Run the build script as normal user (do NOT use sudo for this)
./build.sh

# Install the generated .deb package
sudo dpkg -i ./claude-desktop_*.deb

# Fix missing dependencies if any
sudo apt --fix-broken install -y
