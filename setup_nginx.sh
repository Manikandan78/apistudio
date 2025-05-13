#!/bin/bash

# Function to check if nginx is installed
is_nginx_installed() {
    if command -v nginx &> /dev/null; then
        return 0
    else
        return 1
    fi
}

echo "🔍 Checking if Nginx is installed..."

if is_nginx_installed; then
    echo "✅ Nginx is already installed."
else
    echo "🚀 Installing Nginx..."
    sudo apt update
    sudo apt install -y nginx
fi

# Show Nginx version
echo "📦 Nginx version:"
nginx -v

# Start and enable nginx
echo "📡 Starting Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Show service status
echo "🔄 Nginx status:"
sudo systemctl status nginx | grep Active

# Open in browser
echo "🌍 Opening http://localhost in the browser..."

# Cross-platform browser opening
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost
elif command -v sensible-browser &> /dev/null; then
    sensible-browser http://localhost
else
    echo "⚠️ Could not detect a method to open the browser. Please open http://localhost manually."
fi
