Complete script to clone, build, and install Claude Desktop on Kali Linux properly, assuming normal user execution:

```bash
#!/bin/bash
set -e

# Step 1: Update system and remove old nodejs if exists
sudo apt update
sudo apt remove -y nodejs npm

# Step 2: Install necessary dependencies
sudo apt install -y git curl p7zip-full wget imagemagick icoutils dpkg-dev

# Step 3: Install Node.js 22.x from NodeSource
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs npm

# Step 4: Install electron-builder globally without sudo
npm install -g electron-builder --location=global

# Step 5: Clone Claude Desktop Debian repo if not already cloned
if [ ! -d "$HOME/claude-desktop-debian" ]; then
  git clone https://github.com/aaddrick/claude-desktop-debian.git "$HOME/claude-desktop-debian"
fi

cd "$HOME/claude-desktop-debian"

# Step 6: Run build script as normal user (no sudo)
./build.sh

# Step 7: Install the built Debian package with proper permissions
sudo apt install -y ./claude-desktop_*.deb || sudo apt --fix-broken install -y

echo "Claude Desktop installation is complete!"
echo "Run the app via the application menu or by executing 'claude-desktop' in terminal."

```

Save this as `install_claude_desktop.sh`, then run:

```bash
chmod +x install_claude_desktop.sh
./install_claude_desktop.sh
```

This will handle everything step-by-step, respecting the build script’s requirement to **not run as root** while installing system packages as needed.
