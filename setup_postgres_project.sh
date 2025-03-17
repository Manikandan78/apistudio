#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

REPO_URL="https://github.com/Manikandan78/home-manager-config.git"
REPO_DIR="$HOME/home-manager-config"

echo "🔹 Updating system and installing dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl wget python3-venv python3-pip \
    postgresql postgresql-contrib nginx systemd

echo "✅ Dependencies installed."

# Fixing Nix daemon issues
echo "🔹 Checking Nix daemon..."
if ! systemctl is-active --quiet nix-daemon; then
    echo "❌ Nix daemon is not running. Restarting..."
    sudo systemctl restart nix-daemon
    sleep 2
    if systemctl is-active --quiet nix-daemon; then
        echo "✅ Nix daemon restarted successfully."
    else
        echo "❌ Failed to restart Nix daemon. Check logs with: journalctl -xe"
        exit 1
    fi
else
    echo "✅ Nix daemon is running."
fi

# Clone the repository if missing
if [ ! -d "$REPO_DIR" ]; then
    echo "🔹 Cloning Home Manager repository..."
    git clone "$REPO_URL" "$REPO_DIR" || {
        echo "❌ Failed to clone repository. Creating a new one..."
        mkdir -p "$REPO_DIR"
        cd "$REPO_DIR"
        git init
        touch home.nix
        echo "{ config, pkgs, ... }: { home.username = builtins.getEnv \"USER\"; home.homeDirectory = builtins.getEnv \"HOME\"; home.stateVersion = \"23.11\"; programs.bash.enable = true; programs.git.enable = true; }" > home.nix
        git add home.nix
        git commit -m "Initial Home Manager config"
    }
else
    echo "✅ Repository found. Pulling latest updates..."
    cd "$REPO_DIR"
    git pull origin main || echo "⚠️ Failed to pull updates. Continuing..."
fi

# Install Home Manager if not installed
if ! command -v home-manager &> /dev/null; then
    echo "🔹 Installing Home Manager..."
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-env -iA nixpkgs.home-manager
    echo "✅ Home Manager installed."
fi

# Ensure home.nix exists
if [ ! -f "$REPO_DIR/home.nix" ]; then
    echo "🔹 Creating default home.nix..."
    echo "{ config, pkgs, ... }: { home.username = builtins.getEnv \"USER\"; home.homeDirectory = builtins.getEnv \"HOME\"; home.stateVersion = \"23.11\"; programs.bash.enable = true; programs.git.enable = true; }" > "$REPO_DIR/home.nix"
fi

# Fix potential conflicts
echo "🔹 Removing conflicting packages..."
nix-env -e home-manager || true
nix-collect-garbage -d
nix-store --verify --repair
nix-channel --update
nix-env -iA nixpkgs.home-manager

# Configure Home Manager
echo "🔹 Configuring Home Manager..."
home-manager switch --show-trace || {
    echo "❌ Home Manager setup failed. Check configuration and logs."
    exit 1
}

echo "✅ Home Manager setup complete. It should now start automatically with the arrow prompt."
