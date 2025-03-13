#!/bin/bash
set -e

echo "🔹 Creating systemd service..."
SERVICE_PATH="$HOME/.config/systemd/user/nix_project.service"
mkdir -p ~/.config/systemd/user

cat <<EOT > "$SERVICE_PATH"
[Unit]
Description=Nix Project Service
After=network.target

[Service]
ExecStart=$HOME/nix_project/start_project.sh
WorkingDirectory=$HOME/nix_project
Restart=always
User=$USER

[Install]
WantedBy=default.target
EOT

echo "🔹 Enabling and starting service..."
systemctl --user daemon-reload
systemctl --user enable nix_project
systemctl --user start nix_project

echo "✅ Project service setup completed!"
