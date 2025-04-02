#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

PROJECT_DIR="$HOME/API-STUDIO/ApiStudio"
REQ_FILE="requirements.txt"
VENV_DIR="venv"
LOG_FILE="$PROJECT_DIR/install.log"

# Redirect all output to a log file for troubleshooting
exec > >(tee -a "$LOG_FILE") 2>&1

echo "Starting installation..."

# Navigate to project directory
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Project directory not found! Exiting..."
    exit 1
fi
cd "$PROJECT_DIR"

echo "Checking for $REQ_FILE..."
if [ ! -f "$REQ_FILE" ]; then
    echo "$REQ_FILE not found! Exiting..."
    exit 1
fi

# Install system dependencies
echo "Installing system dependencies..."
if command -v apt &>/dev/null; then
    sudo apt update
    sudo apt install -y libpq-dev python3-dev build-essential || {
        echo "Failed to install system dependencies via apt!"
        exit 1
    }
elif command -v dnf &>/dev/null; then
    sudo dnf install -y postgresql-devel python3-devel gcc || exit 1
elif command -v pacman &>/dev/null; then
    sudo pacman -Sy postgresql-libs || exit 1
else
    echo "Unsupported package manager. Please install libpq-dev manually."
    exit 1
fi

# Attempt to fix broken packages (e.g., pgadmin4 issues)
echo "Running package reconfiguration..."
sudo dpkg --configure -a || true
sudo apt install -f -y || true

# If pgAdmin4 packages are still problematic, remove them.
if dpkg -l | grep -q "pgadmin4-desktop"; then
    echo "Detected pgadmin4-desktop package issues. Attempting removal..."
    sudo apt remove --purge -y pgadmin4 pgadmin4-desktop || true
    sudo apt autoremove -y || true
fi

# Remove existing virtual environment if it exists
if [ -d "$VENV_DIR" ]; then
    echo "Existing virtual environment found. Removing..."
    rm -rf "$VENV_DIR"
fi

# Create a new virtual environment
echo "Creating a new virtual environment..."
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

echo "Upgrading pip..."
pip install --upgrade pip

# Fix python-magic-bin issue if present
if grep -q "python-magic-bin==0.4.14" "$REQ_FILE"; then
    echo "Fixing python-magic-bin issue..."
    sed -i '/python-magic-bin==0.4.14/d' "$REQ_FILE"
    pip install python-magic
fi

echo "Installing Python dependencies..."
pip install -r "$REQ_FILE" || {
    echo "Dependency installation failed! Check the log file for details."
    exit 1
}

echo "Installation complete!"

# Check AppArmor status (for troubleshooting pgAdmin4 issues)
if command -v aa-status &>/dev/null; then
    echo "Checking AppArmor status..."
    sudo aa-status || echo "AppArmor may not be running correctly. Manual intervention might be required."
fi
