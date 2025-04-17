#!/bin/bash

set -e  # Exit on error

PROJECT_DIR="$HOME/API-STUDIO/PostApi"
REQ_FILE="req.txt"
VENV_DIR="$PROJECT_DIR/venv"
SERVICE_NAME="postapi"
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service"

# Navigate to project directory
cd "$PROJECT_DIR" || { echo "Project directory not found! Exiting..."; exit 1; }

echo "Checking for $REQ_FILE..."
if [ ! -f "$REQ_FILE" ]; then
    echo "$REQ_FILE not found! Exiting..."
    exit 1
fi

# Install system dependencies
echo "Installing system dependencies for PostgreSQL..."
if command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y libpq-dev python3-dev build-essential
elif command -v dnf &>/dev/null; then
    sudo dnf install -y postgresql-devel python3-devel gcc
elif command -v pacman &>/dev/null; then
    sudo pacman -Sy postgresql-libs
else
    echo "Unsupported package manager. Please install libpq-dev manually."
    exit 1
fi

# Remove existing virtual environment if it exists
if [ -d "$VENV_DIR" ]; then
    echo "Existing virtual environment found. Removing..."
    rm -rf "$VENV_DIR"
fi

echo "Creating a new virtual environment..."
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

echo "Installing dependencies..."
pip install --upgrade pip

# Fix python-magic-bin issue
if grep -q "python-magic-bin==0.4.14" "$REQ_FILE"; then
    echo "Fixing python-magic-bin issue..."
    sed -i '/python-magic-bin==0.4.14/d' "$REQ_FILE"
    pip install python-magic
fi

pip install -r "$REQ_FILE"

# Create a systemd service
echo "Creating systemd service..."

sudo bash -c "cat > $SERVICE_FILE" <<EOF
[Unit]
Description=PostApi FastAPI Service
After=network.target

[Service]
User=$USER
WorkingDirectory=$PROJECT_DIR
ExecStart=$VENV_DIR/bin/uvicorn main:app --host 0.0.0.0 --port 8000 --workers 4
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and enable the service
echo "Enabling and starting the service..."
sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME
sudo systemctl restart $SERVICE_NAME

echo "Installation and service setup complete! API running at http://localhost:8000"

exit 0
