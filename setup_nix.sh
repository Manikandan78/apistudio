#!/bin/bash
set -e

echo "🔹 Updating system and installing dependencies..."
sudo apt update && sudo apt install -y git curl wget python3-venv python3-pip postgresql postgresql-contrib nginx systemd || {
  echo "❌ Failed to install required dependencies. Check your internet connection."
  exit 1
}

echo "✅ Dependencies installed."

# Ensure Nix is installed
if ! command -v nix &>/dev/null; then
  echo "🔹 Installing Nix package manager..."
  sh <(curl -L https://nixos.org/nix/install) --daemon || {
    echo "❌ Failed to install Nix."
    exit 1
  }
  . ~/.nix-profile/etc/profile.d/nix.sh
  echo "✅ Nix installed."
fi

# Restart the Nix daemon if not running
echo "🔹 Checking Nix daemon..."
if ! systemctl is-active --quiet nix-daemon.service; then
  echo "🔹 Restarting Nix daemon..."
  sudo systemctl restart nix-daemon.service || {
    echo "❌ Failed to restart Nix daemon. Trying to re-enable it..."
    sudo systemctl enable --now nix-daemon.service || {
      echo "❌ Nix daemon could not be started."
      exit 1
    }
  }
fi
echo "✅ Nix daemon is running."

# Ensure Home Manager is installed
if ! command -v home-manager &>/dev/null; then
  echo "🔹 Installing Home Manager..."
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install || {
    echo "❌ Failed to install Home Manager."
    exit 1
  }
  echo "✅ Home Manager installed."
fi

# Clone or pull latest Home Manager config
CONFIG_DIR="$HOME/.config/home-manager"
REPO_URL="https://github.com/Manikandan78/home-manager-config.git"

if [ ! -d "$CONFIG_DIR" ]; then
  echo "🔹 Cloning Home Manager config..."
  git clone "$REPO_URL" "$CONFIG_DIR" || {
    echo "❌ Failed to clone repository."
    exit 1
  }
else
  echo "🔹 Pulling latest updates..."
  cd "$CONFIG_DIR" && git pull || {
    echo "❌ Failed to update repository."
    exit 1
  }
fi
echo "✅ Home Manager config is ready."

# Switch to the new configuration
echo "🔹 Activating Home Manager configuration..."
home-manager switch --flake "$CONFIG_DIR" || {
  echo "❌ Failed to activate Home Manager configuration."
  exit 1
}
echo "✅ Home Manager activated successfully."

# Add Starship prompt if missing
if ! grep -q "starship" ~/.bashrc; then
  echo "🔹 Adding Starship prompt..."
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
  echo "✅ Starship added."
fi

echo "🔹 Reloading shell..."
exec bash
echo "✅ Setup complete! Your Home Manager is activated. ➜"

