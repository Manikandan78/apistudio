#!/bin/bash
set -e

REPO_URL="git@github.com:Manikandan78/Nix_package_project.git"
INSTALL_DIR="$HOME/nix_project"

echo "🔹 Cloning repository..."
if [ -d "$INSTALL_DIR" ]; then
    echo "⚠️ Repository already exists. Pulling latest updates..."
    cd "$INSTALL_DIR" && git pull
else
    git clone "$REPO_URL" "$INSTALL_DIR"
    cd "$INSTALL_DIR" || exit 1
fi

echo "🔹 Setting up virtual environment..."
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

echo "✅ Project setup complete!"
