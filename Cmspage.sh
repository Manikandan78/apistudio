#!/bin/bash

set -e  # Exit on error

# Configuration
PROJECT_DIR="$HOME/API-STUDIO/CmsPage"
REQ_FILE="req.txt"
VENV_DIR="venv"
UVICORN_PORT=8008

# Navigate to project directory
cd "$PROJECT_DIR" || { echo "Project directory not found! Exiting..."; exit 1; }

echo "Checking for $REQ_FILE..."
if [ ! -f "$REQ_FILE" ]; then
    echo "$REQ_FILE not found! Exiting..."
    exit 1
fi

# Install system dependencies
echo "Installing system dependencies for PostgreSQL and build tools..."
if command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y libpq-dev python3-dev build-essential nginx
elif command -v dnf &>/dev/null; then
    sudo dnf install -y postgresql-devel python3-devel gcc nginx
elif command -v pacman &>/dev/null; then
    sudo pacman -Sy postgresql-libs nginx
else
    echo "Unsupported package manager. Please install dependencies manually."
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

echo "Installing Python dependencies..."
pip install --upgrade pip

# Fix python-magic-bin issue
if grep -q "python-magic-bin==0.4.14" "$REQ_FILE"; then
    echo "Fixing python-magic-bin issue..."
    sed -i '/python-magic-bin==0.4.14/d' "$REQ_FILE"
    pip install python-magic
fi

pip install -r "$REQ_FILE"
pip install uvicorn[standard]

# Set up Nginx config
NGINX_CONF="/etc/nginx/sites-available/fastapi_cms"
echo "Creating Nginx config using IP address..."

sudo tee "$NGINX_CONF" > /dev/null <<EOF
server {
    listen 80;

    location / {
        proxy_pass http://127.0.0.1:$UVICORN_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

# Enable Nginx config
if [ -d /etc/nginx/sites-enabled ]; then
    sudo ln -sf "$NGINX_CONF" /etc/nginx/sites-enabled/
fi

echo "Testing Nginx configuration..."
sudo nginx -t && sudo systemctl reload nginx

# --- Continue to Django ApiStudio setup ---
cd "$HOME/API-STUDIO/ApiStudio"

echo "Setting up Django environment..."
if [ -d "venv" ]; then
    echo "Removing old Django virtual environment..."
    rm -rf venv
fi

python3 -m venv venv
source venv/bin/activate

if [ ! -f "requirements.txt" ]; then
    echo "Django requirements.txt not found! Skipping Django setup..."
else
    pip install --upgrade pip
    pip install -r requirements.txt
    echo "Django dependencies installed."
fi

# Go back to FastAPI project and run the server inline
cd "$PROJECT_DIR"
source "$VENV_DIR/bin/activate"
echo "Starting Uvicorn server..."
exec uvicorn main:app --host 127.0.0.1 --port $UVICORN_PORT --reload

