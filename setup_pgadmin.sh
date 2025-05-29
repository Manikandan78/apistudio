#!/bin/bash

set -e  # Exit on any error

echo "🔧 Installing pgAdmin 4 Desktop version..."

# Step 1: Update system and install dependencies
sudo apt update -y
sudo apt install -y curl ca-certificates gnupg lsb-release

# Step 2: Add the pgAdmin public GPG key
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | \
    sudo gpg --dearmor -o /usr/share/keyrings/pgadmin-keyring.gpg

# Step 3: Add pgAdmin repository
echo "deb [signed-by=/usr/share/keyrings/pgadmin-keyring.gpg] \
https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" \
| sudo tee /etc/apt/sources.list.d/pgadmin4.list

# Step 4: Update package list again
sudo apt update -y

# Step 5: Install pgAdmin desktop mode
sudo apt install -y pgadmin4-desktop

echo "✅ pgAdmin 4 Desktop installed successfully."

# Optional: Launch immediately
# pgadmin4 &

# Info for user
echo "📦 You can now launch pgAdmin by:"
echo "   - Typing 'pgadmin4' in terminal"
echo "   - Searching 'pgAdmin 4' in your application menu"
