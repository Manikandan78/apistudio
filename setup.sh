#!/bin/bash

set -e  # Exit script immediately if any command fails

# Function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Function to check if a package is installed (for Debian-based distros)
is_package_installed() {
    dpkg -l | grep -q "^ii  $1 "
}

echo " Detecting Linux Distribution..."
OS_NAME=$(grep -oP '^ID=\K.*' /etc/os-release | tr -d '"')
echo " Detected OS: $OS_NAME"

# Install required dependencies
echo " Installing required dependencies..."
if [[ "$OS_NAME" == "ubuntu" || "$OS_NAME" == "debian" ]]; then
    sudo apt update
    for pkg in curl git; do
        if ! is_package_installed "$pkg"; then
            sudo apt install -y "$pkg"
        else
            echo " $pkg is already installed. Skipping..."
        fi
    done
elif [[ "$OS_NAME" == "fedora" || "$OS_NAME" == "centos" || "$OS_NAME" == "rhel" ]]; then
    sudo dnf install -y curl git
elif [[ "$OS_NAME" == "arch" ]]; then
    sudo pacman -Sy --noconfirm curl git
else
    echo " Warning: Unrecognized Linux distribution. Trying generic installation..."
fi

# Install Nix package manager
echo " Installing Nix package manager..."
if ! command_exists nix; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    . /home/$USER/.nix-profile/etc/profile.d/nix.sh
else
    echo " Nix is already installed. Skipping..."
fi

# Enable Flakes and Unfree Packages
echo "Enabling Flakes and Unfree Packages..."
NIX_CONF=~/.config/nix/nix.conf
mkdir -p ~/.config/nix
if ! grep -q "experimental-features = nix-command flakes" "$NIX_CONF" 2>/dev/null; then
    echo -e "experimental-features = nix-command flakes\ndefault-sandbox = false" | tee -a "$NIX_CONF"
else
    echo " Flakes and unfree packages already enabled. Skipping..."
fi

# Install Home Manager
echo " Installing Home Manager..."
if ! command_exists home-manager; then
    nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
    nix-channel --update
    nix-env -iA home-manager
else
    echo " Home Manager is already installed. Skipping..."
fi 

