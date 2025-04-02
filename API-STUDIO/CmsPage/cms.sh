#!/bin/bash

set -e  # Exit on error

PROJECT_DIR="$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage"
VENV_DIR="$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage/venv"
SERVICE_NAME="cms_page_service"
SERVICE_FILE="$HOME/.config/systemd/user/CMS.service"
PORT_NUMBER=8009  # Fixed port number

# Ensure systemd user services directory exists
mkdir -p "$HOME/.config/systemd/user"

echo "🔹 Setting up project in: $PROJECT_DIR"

# Check if the directory exists
if [ ! -d "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage" ]; then
    echo "❌ Project directory not found: $PROJECT_DIR"
    exit 1
fi

# Remove existing virtual environment if it exists
if [ -d "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage/venv" ]; then
    echo "🔄 Removing existing virtual environment..."
    rm -rf "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage/venv"
fi

# Create a new virtual environment
echo "🚀 Creating new virtual environment..."
python3 -m venv "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage/venv"

# Activate virtual environment
source "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage/venv/bin/activate"

# Identify the correct requirements.txt file
REQ_FILE=$(find "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage" -type f -name "req.txt")

if [ -f "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage" ]; then
    echo "📦 Installing dependencies from $REQ_FILE..."
    pip install --upgrade pip
    pip install -r "$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage/req.txt"
else
    echo "⚠️ No requirements.txt found. Skipping dependencies installation."
fi

deactivate  # Deactivate virtual environment

# Create systemd service file with the fixed port
cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=CMS Page API Service
After=network.target

[Service]
WorkingDirectory=$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage
ExecStart="$HOME/nix_project/NANOX-API-STUDIO-master/CmsPage/venv/bin/uvicorn main:app --host 127.0.0.1 --port 8008 --workers 2
Restart=always
User=$USER

[Install]
WantedBy=default.target
EOF

echo "✅ Systemd service file created at: $SERVICE_FILE"

# Reload systemd, enable and start the service
systemctl --user daemon-reload
systemctl --user enable "CMS.service"
systemctl --user start "CMS.service"

echo "🚀 CMS Page is now running on port 8008 as a service!"

