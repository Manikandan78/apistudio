#!/bin/bash

set -e  # Exit on error

# Define project directory
PROJECT_DIR="$HOME/nix_project/NANOX-API-STUDIO-master/Authentication"
REQ_FILE="$PROJECT_DIR/req.txt"
VENV_DIR="$PROJECT_DIR/venv"

# Navigate to project directory
if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ Project directory not found: $PROJECT_DIR"
    exit 1
fi
cd "$PROJECT_DIR"

# Check if requirements.txt exists
if [ ! -f "$REQ_FILE" ]; then
    echo "❌ $REQ_FILE not found! Exiting..."
    exit 1
fi
echo "✅ requirements.txt found."

# Install system dependencies (PostgreSQL, Python headers, GCC, etc.)
echo "🔄 Installing system dependencies..."
if command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y libpq-dev python3-dev build-essential
elif command -v dnf &>/dev/null; then
    sudo dnf install -y postgresql-devel python3-devel gcc
elif command -v pacman &>/dev/null; then
    sudo pacman -Sy postgresql-libs
else
    echo "❌ Unsupported package manager. Please install libpq-dev manually."
    exit 1
fi

# Remove existing virtual environment if present
if [ -d "$VENV_DIR" ]; then
    echo "🧹 Removing existing virtual environment..."
    rm -rf "$VENV_DIR"
fi

# Create a new virtual environment
echo "🌱 Creating a new virtual environment..."
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

# Upgrade pip and install dependencies
echo "📦 Installing dependencies from $REQ_FILE..."
pip install --upgrade pip

# Check if python-magic-bin exists in requirements and fix the issue
if grep -q "python-magic-bin==0.4.14" "$REQ_FILE"; then
    echo "⚠️ Fixing python-magic-bin issue..."
    sed -i '/python-magic-bin==0.4.14/d' "$REQ_FILE"
    pip install python-magic
fi

pip install -r "$REQ_FILE"

echo "✅ Installation complete! 🎉"
