  GNU nano 7.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                  DeleteApi.sh                                                                                                                                                                                                                                                                                                                                                                                                                                                                            #!/bin/bash

PROJECT_NAME="CoreApi"
PROJECT_DIR="$HOME/API-STUDIO/$PROJECT_NAME"
REQ_FILE="1.txt"
VENV_DIR="venv"
PORT=8007
IP_ADDR="172.27.226.245"

echo "🔧 Starting setup for $PROJECT_NAME..."

# === Step 1: Navigate to project directory
cd "$PROJECT_DIR" || { echo "❌ Project directory not found! Exiting..."; exit 1; }

# === Step 2: Ensure requirements file exists
echo "📁 Checking for requirements file: $REQ_FILE..."
if [ ! -f "$REQ_FILE" ]; then
    echo "❌ $REQ_FILE not found! Exiting..."
    exit 1
fi

# === Step 3: Forcefully remove existing virtual environment
if [ -d "$VENV_DIR" ]; then
    echo "🧹 Removing existing virtual environment..."
    rm -rf "$VENV_DIR"
    if [ -d "$VENV_DIR" ]; then
        echo "❌ Failed to remove virtual environment. Check permissions."
        exit 1
    fi
fi

# === Step 4: Create and activate virtual environment
echo "🐍 Creating new virtual environment..."
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

# === Step 5: Install requirements
echo "📦 Installing dependencies..."
pip install --upgrade pip

# Remove problematic python-magic-bin (if present)
if grep -q "python-magic-bin==0.4.14" "$REQ_FILE"; then
    echo "⚙️ Removing python-magic-bin==0.4.14 from requirements..."
    sed -i '/python-magic-bin==0.4.14/d' "$REQ_FILE"
fi

# Install main requirements
pip install -r "$REQ_FILE"

# Explicitly ensure python-magic is installed
if ! python -c "import magic" &> /dev/null; then
    echo "🔮 Installing python-magic explicitly..."
    pip install python-magic
else
    echo "✅ python-magic already available."
fi

# === Step 6: Create Uvicorn systemd service file
echo "📝 Creating Uvicorn service for $PROJECT_NAME..."

UVICORN_SERVICE="/etc/systemd/system/$PROJECT_NAME.service"

if [ ! -f "$UVICORN_SERVICE" ]; then
    sudo tee "$UVICORN_SERVICE" > /dev/null <<EOF
[Unit]
Description=Uvicorn instance to serve $PROJECT_NAME
After=network.target

[Service]
User=mani
Group=www-data
WorkingDirectory=$PROJECT_DIR
Environment="PATH=$PROJECT_DIR/$VENV_DIR/bin"
ExecStart=$PROJECT_DIR/$VENV_DIR/bin/uvicorn main:app --host 0.0.0.0 --port $PORT --reload

Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

    echo "🔧 Enabling and starting Uvicorn service..."
    sudo systemctl daemon-reload
    sudo systemctl enable "$PROJECT_NAME"
    sudo systemctl start "$PROJECT_NAME"
else
    echo "✅ Uvicorn service file already exists. Restarting service..."
    sudo systemctl restart "$PROJECT_NAME"
fi

# === Step 7: Check Uvicorn service status
echo "🧪 Checking Uvicorn service status..."
sudo systemctl status "$PROJECT_NAME" --no-pager

# === Step 8: Configure Nginx reverse proxy
NGINX_CONF="/etc/nginx/conf.d/microapi.conf"

if [ ! -f "$NGINX_CONF" ]; then
    echo "🔧 Creating Nginx config for /crudapp/ path..."
    sudo tee "$NGINX_CONF" > /dev/null <<EOF
server {
    listen 80;
    server_name $IP_ADDR;

    location /crudapp/ {
        proxy_pass http://172.27.226.245:$PORT/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

    echo "🔗 Enabling site and reloading Nginx..."
    sudo ln -sf "$NGINX_CONF" /etc/nginx/sites-enabled/$PROJECT_NAME
    sudo nginx -t && sudo systemctl reload nginx
    sudo systemctl status nginx
else
    echo "✅ Nginx config already exists. Reloading..."
    sudo nginx -t && sudo systemctl restart nginx
    sudo systemctl status nginx
fi


echo "✅ Setup complete!"
echo "🌐 Access your app here: http://$IP_ADDR:$PORT/coreapi/"
