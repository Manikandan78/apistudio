#!/bin/bash

set -e  # Exit on error

# Function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

echo " Checking Python 3.11 installation..."
if command_exists python3.11; then
    echo " Python 3.11 is already installed. Skipping installation."
else
    echo " Installing Python 3.11..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository -y ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install -y python3.11 python3.11-venv python3.11-dev
    sudo apt install python3-pip
    sudo apt install python3.12-venv
    echo " Python 3.11 installation completed."
fi

echo " Checking PostgreSQL installation..."
if command_exists psql; then
    echo " PostgreSQL is already installed. Skipping installation."
else
    echo "Installing PostgreSQL..."
    sudo apt update
    sudo apt install -y postgresql postgresql-contrib
    echo " PostgreSQL installation completed."
fi

echo "Verifying Python 3.11 and PostgreSQL versions..."
python3.11 --version || echo "⚠️Python 3.11 installation verification failed!"
psql --version || echo "⚠️PostgreSQL installation verification failed!"

echo "Setup complete! Python 3.11 and PostgreSQL are installed."
