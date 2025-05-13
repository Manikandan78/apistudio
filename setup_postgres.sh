#!/bin/bash

set -e  # Exit immediately on error

# Variables - update DB_PASSWORD as needed
PG_SERVICE="postgresql"
DB_NAME="apicloud"
DB_USER="microapi"
DB_PASSWORD="M!cr0ap!*C$E*"  # Replace with a secure password
SCHEMA1="public"
SCHEMA2="api_studio"
LOG_FILE="./install.log"

# Redirect output to a log file for troubleshooting
exec > >(tee -a "$LOG_FILE") 2>&1

echo "Starting setup..."

# Ensure PostgreSQL is running
if ! systemctl is-active --quiet "$PG_SERVICE"; then
    echo " PostgreSQL is not running. Starting service..."
    sudo systemctl start "$PG_SERVICE"
    sleep 2  # Allow some time for PostgreSQL to start
    if ! systemctl is-active --quiet "$PG_SERVICE"; then
        echo "⚠️Failed to start PostgreSQL. Exiting..."
        exit 1
    fi
fi
echo " PostgreSQL is running."

# Create database and user with password if they do not exist
echo " Creating database '$DB_NAME' and user '$DB_USER'..."
sudo -u postgres psql <<EOF
-- Create user if it doesn't exist
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = '$DB_USER') THEN
        CREATE ROLE $DB_USER WITH LOGIN PASSWORD '$DB_PASSWORD';
    END IF;
END
\$\$;

-- Create database if it doesn't exist
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB_NAME') THEN
        CREATE DATABASE $DB_NAME OWNER $DB_USER;
    END IF;
END
\$\$;
EOF
echo " Database and user verified."

# Create two schemas in the database
echo " Creating schemas '$SCHEMA1' and '$SCHEMA2' in database '$DB_NAME'..."
sudo -u postgres psql -d "$DB_NAME" <<EOF
CREATE SCHEMA IF NOT EXISTS $SCHEMA1 AUTHORIZATION $DB_USER;
CREATE SCHEMA IF NOT EXISTS $SCHEMA2 AUTHORIZATION $DB_USER;
EOF
echo " Schemas created."

# Check and install pgAdmin4 automatically via Snap
echo " Checking pgAdmin4 installation..."
if ! command -v pgadmin4 &>/dev/null; then
    echo "pgAdmin4 not found. Attempting to install via Snap..."
    if command -v snap &>/dev/null; then
        sudo snap install pgadmin4 || { echo "⚠️Snap installation of pgAdmin4 failed. Exiting."; exit 1; }
    else
        echo "nap is not installed. Please install Snap or pgAdmin4 manually."; exit 1
    fi
else
    echo " pgAdmin4 is already installed."
fi

# Verify pgAdmin4 installation
if command -v pgadmin4 &>/dev/null; then
    echo " pgAdmin4 installed successfully."
else
    echo " pgAdmin4 installation verification failed."
    exit 1
fi

# Open pgAdmin4 automatically
echo "Opening pgAdmin4..."
pgadmin4 &

echo " Setup complete. Database, schemas, and pgAdmin4 are ready."
