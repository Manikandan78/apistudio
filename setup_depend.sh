#!/bin/bash

set -e  # Exit on error

# Variables
DB_USER="micro_api"
DB_PASSWORD="MICRO@123"
DB_NAME="apicloud"
PGADMIN_DEFAULT_EMAIL="admin@microapi.com"
PGADMIN_DEFAULT_PASSWORD="MICRO@123"

# Update and install dependencies
echo "🔹 Updating system and installing dependencies..."
sudo apt update && sudo apt upgrade -y

# Ensure pgAdmin repository is added
if ! grep -q "pgadmin" /etc/apt/sources.list.d/pgadmin4.list 2>/dev/null; then
    echo "🔹 Adding pgAdmin repository..."
    sudo curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmour -o /usr/share/keyrings/pgadmin-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/pgadmin-keyring.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" | sudo tee /etc/apt/sources.list.d/pgadmin4.list
    sudo apt update
fi

# Install required packages
sudo apt install -y python3 python3-venv python3-pip \
    postgresql postgresql-contrib nginx apache2 pgadmin4-web

echo "✅ Dependencies installed."

# Start and Enable PostgreSQL
echo "🔹 Starting PostgreSQL..."
sudo systemctl enable --now postgresql

echo "✅ PostgreSQL is running."

# Create PostgreSQL User and Database
echo "🔹 Configuring PostgreSQL..."
sudo -u postgres psql <<EOF
DO 
\$_$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '$DB_USER') THEN
      CREATE ROLE $DB_USER WITH LOGIN PASSWORD '$DB_PASSWORD';
      ALTER ROLE $DB_USER CREATEDB;
   END IF;
END
\$_$;

CREATE DATABASE $DB_NAME OWNER $DB_USER;
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

echo "✅ PostgreSQL user & database configured."

# Fix Apache Port Conflict
echo "🔹 Checking and fixing Apache port conflicts..."
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf

# Ensure Apache default site is disabled
sudo a2dissite 000-default.conf || true
sudo systemctl restart apache2

echo "✅ Apache is set to use port 8080 and default site is disabled."

# Enable required Apache modules
echo "🔹 Enabling required Apache modules..."
sudo a2enmod ssl rewrite proxy proxy_http headers
sudo systemctl restart apache2 || echo "⚠️ Apache restart failed. Check logs."

echo "✅ Apache modules configured."

# Configure pgAdmin 4
echo "🔹 Configuring pgAdmin 4..."
sudo mkdir -p /var/lib/pgadmin
sudo chown -R "$USER:$USER" /var/lib/pgadmin
export PGADMIN_SETUP_EMAIL="$PGADMIN_DEFAULT_EMAIL"
export PGADMIN_SETUP_PASSWORD="$PGADMIN_DEFAULT_PASSWORD"
sudo -E /usr/pgadmin4/bin/setup-web.sh --yes
sudo systemctl enable --now apache2 || echo "⚠️ Apache failed to enable, check logs."

echo "✅ pgAdmin 4 is configured."

# Start and Enable Nginx
echo "🔹 Starting Nginx..."
sudo systemctl enable --now nginx

echo "✅ Nginx is running."

# Error Handling & Debugging
if ! systemctl is-active --quiet postgresql; then
    echo "❌ PostgreSQL failed to start. Check logs: journalctl -xe"
    exit 1
fi

if ! systemctl is-active --quiet apache2; then
    echo "❌ Apache failed to start. Attempting to fix..."
    sudo systemctl restart apache2 || echo "⚠️ Apache restart failed. Check logs."
fi

if ! systemctl is-active --quiet nginx; then
    echo "❌ Nginx failed to start. Check logs: journalctl -xe"
    exit 1
fi

echo "🚀 Setup complete. PostgreSQL, pgAdmin, Apache (on port 8080), and Nginx are running successfully!"

