#!/bin/bash

set -e  # Exit on error

PROJECT_DIR="$HOME/API-STUDIO/CrudApp"
REQ_FILE="new_req.txt"
VENV_DIR="venv"

# Navigate to project directory
cd "$PROJECT_DIR" || { echo "Project directory not found! Exiting..."; exit 1; }

echo "Checking for $REQ_FILE..."
if [ ! -f "$REQ_FILE" ]; then
    echo "$REQ_FILE not found! Exiting..."
    exit 1
fi

echo "Creating a new virtual environment..."
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

echo "Installing dependencies..."
pip install --upgrade pip

# Handle python-magic-bin issue
if grep -q "python-magic-bin==0.4.14" "$REQ_FILE"; then
    echo "Fixing python-magic-bin issue..."
    sed -i '/python-magic-bin==0.4.14/d' "$REQ_FILE"  # Remove from requirements.txt
    pip install python-magic  # Install alternative package
fi

pip install -r "$REQ_FILE"

echo "Installation complete!"

