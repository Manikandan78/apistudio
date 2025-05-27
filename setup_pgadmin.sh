#!/bin/bash

set -e

echo "🔄 Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "🔐 Installing required tools..."
sudo apt install curl ca-certificates gnupg -y

echo "📥 Adding pgAdmin APT repository..."
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | gpg --dearmor | sudo tee /usr/share/keyrings/pgadmin-keyring.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/pgadmin-keyring.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/ubuntu $(lsb_release -cs) pgadmin4" | sudo tee /etc/apt/sources.list.d/pgadmin4.list

echo "🔄 Refreshing package index..."
sudo apt update

echo "💻 Installing pgAdmin4 Desktop mode..."
sudo apt install pgadmin4-desktop -y

echo "🌐 Installing pgAdmin4 Web mode..."
sudo apt install pgadmin4-web -y

echo "⚙️ Running pgAdmin4 Web setup..."
sudo /usr/pgadmin4/bin/setup-web.sh

echo "✅ pgAdmin 4 (web + desktop) installation complete!"

echo ""
echo "📍 Access pgAdmin Web: http://localhost/pgadmin4"
echo "📍 Launch pgAdmin Desktop from your app menu"
