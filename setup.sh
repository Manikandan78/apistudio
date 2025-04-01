#!/bin/bash

set -e  # Exit on error

# Function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

echo "?? Detecting Linux Distribution..."
OS_NAME=$(grep -oP '^ID=\K.*' /etc/os-release | tr -d '"')

echo "? Detected OS: $OS_NAME"

echo "?? Installing required dependencies..."
if [[ "$OS_NAME" == "ubuntu" || "$OS_NAME" == "debian" ]]; then
    sudo apt update && sudo apt install -y curl git
elif [[ "$OS_NAME" == "fedora" || "$OS_NAME" == "centos" || "$OS_NAME" == "rhel" ]]; then
    sudo dnf install -y curl git
elif [[ "$OS_NAME" == "arch" ]]; then
    sudo pacman -Sy --noconfirm curl git
else
    echo "?? Warning: Unrecognized Linux distribution. Trying generic installation..."
fi

echo "?? Installing Nix package manager..."
if ! command_exists nix; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    . /home/$USER/.nix-profile/etc/profile.d/nix.sh
else
    echo "? Nix is already installed. Skipping..."
fi

echo "?? Enabling Flakes and Unfree Packages..."
mkdir -p ~/.config/nix
echo -e "experimental-features = nix-command flakes" | tee -a ~/.config/nix/nix.conf

echo "?? Installing Home Manager..."
if ! command_exists home-manager; then
    nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
    nix-channel --update
    nix-env -iA home-manager
else
    echo "? Home Manager is already installed. Skipping..."
fi

echo "?? Backing up conflicting files..."
BACKUP_DIR="$HOME/home-manager-backups-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

for file in ".bash_profile" ".bashrc"; do
    if [[ -f "$HOME/$file" ]]; then
        echo "?? Moving $file to backup..."
        mv "$HOME/$file" "$BACKUP_DIR/"
    fi
done

echo "?? Applying Home Manager Configurations..."
home-manager init || echo "?? Home Manager already initialized. Skipping..."

echo "?? Setting up Home Manager Shell Configuration..."
mkdir -p ~/.config/home-manager
cat <<EOF > ~/.config/home-manager/home.nix
{ config, pkgs, ... }:
{
  home.username = "$USER";
  home.homeDirectory = "/home/$USER";

  home.packages = with pkgs; [
    starship   # Arrow prompt
    zsh
  ];

  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.starship.enable = true;

  home.file.".bashrc".text = ''
    eval "\$(starship init bash)"
  '';

  home.stateVersion = "23.11";
}
EOF

echo "?? Activating Home Manager..."
home-manager switch -b backup

echo "?? Setup complete! Nix, Home Manager, and the arrow prompt are installed."
echo "?? Restart your terminal or run: 'source ~/.bashrc' to see the arrow prompt (?)."
