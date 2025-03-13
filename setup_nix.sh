#!/bin/bash
set -e

echo "🔹 Checking if Nix is installed..."
if ! command -v nix &> /dev/null; then
    echo "⚠️ Installing Nix..."
    curl -L https://nixos.org/nix/install | sh
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
    echo "✅ Nix is already installed."
fi

echo "🔹 Enabling Nix Flakes..."
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' | tee -a ~/.config/nix/nix.conf
nix-channel --update

echo "🔹 Installing Home Manager..."
if ! command -v home-manager &> /dev/null; then
    nix run github:nix-community/home-manager -- init --switch
else
    echo "✅ Home Manager is already installed."
fi

echo "🔹 Setting up Home Manager Flake..."
mkdir -p ~/.config/home-manager
cd ~/.config/home-manager

cat > flake.nix <<EOF
{
  description = "Home Manager Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.\${system};
    in {
      homeConfigurations.mani = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
}
EOF

cat > home.nix <<EOF
{ config, pkgs, ... }:
{
  home.username = "mani";
  home.homeDirectory = "/home/mani";
  home.stateVersion = "23.11";

  programs.bash.enable = true;
  programs.git.enable = true;
  programs.starship.enable = true;

  home.file.".bashrc".text = ''
    export PATH=\$HOME/.local/bin:\$PATH
    eval "\$(starship init bash)"
  '';

  home.sessionVariables = {
    EDITOR = "nano";
  };

  home.enable = true;
}
EOF

echo "🔹 Activating Home Manager Configuration..."
nix run  -- switch --flake ~/.config/home-manager#mani

echo "🔹 Applying Shell Changes..."
exec bash
source ~/.bashrc

echo "✅ Home Manager Setup Completed! Restart your terminal if needed."

