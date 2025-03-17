#!/bin/bash

set -e  # Exit on error

# Identify OS
OS=""
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f "/etc/os-release" ]; then
        source /etc/os-release
        OS=$ID
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "nixos" ]]; then
    OS="nixos"
fi

echo " Detected OS: $OS"

# Install Nix Package Manager if not installed
if ! command -v nix &> /dev/null; then
    echo " Installing Nix Package Manager..."
    
    if [ "$OS" == "macos" ]; then
        curl -L https://nixos.org/nix/install | sh
    else
        sh <(curl -L https://nixos.org/nix/install) --daemon
    fi

    echo " Nix installed successfully."
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Fix Nix Daemon issues (for Linux)
if [[ "$OS" != "nixos" ]]; then
    echo " Checking Nix daemon..."
    if ! systemctl is-active --quiet nix-daemon; then
        echo " Nix daemon is not running. Restarting..."
        sudo systemctl restart nix-daemon
        sleep 2
        if systemctl is-active --quiet nix-daemon; then
            echo " Nix daemon restarted successfully."
        else
            echo " Failed to restart Nix daemon. Checking logs..."
            journalctl -u nix-daemon --no-pager
            exit 1
        fi
    else
        echo " Nix daemon is running."
    fi
fi

# Add Nix paths
export PATH="$HOME/.nix-profile/bin:$PATH"

# Install Home Manager
if ! command -v home-manager &> /dev/null; then
    echo " Installing Home Manager..."
    
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-env -iA nixpkgs.home-manager

    echo " Home Manager installed."
fi

# Ensure Home Manager configuration exists
REPO_DIR="$HOME/home-manager-config"
if [ ! -d "$REPO_DIR" ]; then
    echo " Setting up Home Manager configuration..."
    mkdir -p "$REPO_DIR"
    cd "$REPO_DIR"
    git init
    touch home.nix
    cat > home.nix <<EOL
{ config, pkgs, ... }: {
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "23.11";
  programs.bash.enable = true;
  programs.git.enable = true;
  programs.starship = {
    enable = true;
  };
}
EOL
    git add home.nix
    git commit -m "Initial Home Manager config"
fi

# Fix potential conflicts
echo " Fixing Home Manager conflicts..."
nix-env -e home-manager || true
nix-collect-garbage -d
nix-store --verify --repair
nix-channel --update
nix-env -iA nixpkgs.home-manager

# Apply Home Manager configuration
echo " Configuring Home Manager..."
home-manager switch --show-trace || {
    echo " Home Manager setup failed. Checking logs..."
    nix-store --verify --repair
    nix-collect-garbage -d
    nix-channel --update
    home-manager switch --show-trace
}

echo " Home Manager setup complete."

# Ensure Arrow Prompt (using Starship)
if ! grep -q "eval \"\$(starship init bash)\"" "$HOME/.bashrc"; then
    echo 'eval "$(starship init bash)"' >> "$HOME/.bashrc"
fi
if ! grep -q "eval \"\$(starship init zsh)\"" "$HOME/.zshrc"; then
    echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi

echo " Arrow prompt configured. Restart your shell or run 'source ~/.bashrc' to apply changes."
