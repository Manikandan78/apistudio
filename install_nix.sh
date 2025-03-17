#!/bin/bash

set -e  # Exit on error

echo "🔹 Detecting operating system..."
OS_TYPE=$(uname -s)

case "$OS_TYPE" in
    Linux*)
        echo "✅ OS detected: Linux"
        ;;
    Darwin*)
        echo "✅ OS detected: macOS"
        ;;
    *)
        echo "❌ Unsupported OS: $OS_TYPE"
        exit 1
        ;;
esac

# Check if Nix is installed
if ! command -v nix &> /dev/null; then
    echo "⚠️ Nix is NOT installed. Installing Nix..."
    curl -L https://nixos.org/nix/install | sh
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
    echo "✅ Nix is already installed."
fi

# Enable Nix Flakes and Home Manager
echo "🔹 Configuring Nix..."
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" | tee -a ~/.config/nix/nix.conf

# Restart Nix daemon if needed
if ! systemctl is-active --quiet nix-daemon; then
    echo "❌ Nix daemon is not running. Restarting..."
    sudo systemctl restart nix-daemon || echo "⚠️ Failed to restart nix-daemon. Continuing..."
fi

# Install Home Manager
if ! command -v home-manager &> /dev/null; then
    echo "🔹 Installing Home Manager..."
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-env -iA nixpkgs.home-manager
    echo "✅ Home Manager installed."
fi

# Create Home Manager configuration if missing
HM_CONFIG_DIR="$HOME/.config/home-manager"
mkdir -p "$HM_CONFIG_DIR"

if [ ! -f "$HM_CONFIG_DIR/home.nix" ]; then
    echo "🔹 Creating default Home Manager configuration..."
    cat <<EOF > "$HM_CONFIG_DIR/home.nix"
{ config, pkgs, ... }: {
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "23.11";  # Update if needed
  programs.bash.enable = true;
  programs.git.enable = true;
}
EOF
fi

# Apply Home Manager configuration with error handling
echo "🔹 Activating Home Manager..."
if ! home-manager switch; then
    echo "❌ Home Manager setup failed. Debugging..."
    nix-store --verify --repair
    nix-collect-garbage -d
    nix-channel --update
    home-manager switch || echo "⚠️ Home Manager setup still failed. Check logs."
fi

echo "✅ Nix & Home Manager setup complete. It should now start automatically with the arrow prompt."
