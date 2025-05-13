#!/bin/bash

set -e

# === Configuration ===
PROJECT_NAME="apistudio"
PROJECT_DIR="$HOME/API-STUDIO/ApiStudio"
VENV_DIR="$PROJECT_DIR/venv"
PYTHON_BIN="python3"
GUNICORN_PORT=8005
GUNICORN_SERVICE="$PROJECT_NAME"
NGINX_FILE="/etc/nginx/conf.d/apistudio.conf"

echo "🔧 Starting setup for Django project: $PROJECT_NAME"

# === Step 1: Check Project Directory ===
if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ Error: Project directory '$PROJECT_DIR' does not exist!"
    exit 1
fi
cd "$PROJECT_DIR"

# === Step 2: Setup Virtual Environment (Recreate if exists) ===
if [ -d "$VENV_DIR" ]; then
    echo "🗑️ Existing virtual environment found. Removing..."
    rm -rf "$VENV_DIR" || { echo "❌ Failed to remove existing virtual environment."; exit 1; }
fi

echo "📦 Creating new virtual environment..."
$PYTHON_BIN -m venv "$VENV_DIR" || { echo "❌ Failed to create virtual environment."; exit 1; }

# === Step 3: Activate and Install Dependencies ===
if [ ! -f "1.txt" ]; then
    echo "❌ Error: req.txt not found!"
    exit 1
fi

echo "📥 Installing dependencies..."
source "$VENV_DIR/bin/activate"
pip install --upgrade pip
pip install -r 1.txt || { echo "❌ Dependency installation failed."; deactivate; exit 1; }
deactivate

# === Step 4: Create Gunicorn Systemd Service (Skip if exists) ===
SERVICE_FILE="/etc/systemd/system/$GUNICORN_SERVICE.service"
if [ ! -f "$SERVICE_FILE" ]; then
    echo "⚙️ Creating Gunicorn systemd service..."

    sudo bash -c "cat > $SERVICE_FILE" <<EOF
[Unit]
Description=Gunicorn daemon for $PROJECT_NAME
After=network.target

[Service]
User=$USER
Group=www-data
WorkingDirectory=$PROJECT_DIR
ExecStart=$HOME/Apistudio/ApiStudio/venv/bin/python manage.py runserver 172.27.226.245:8005
Restart=always

[Install]
WantedBy=multi-user.target
EOF

    sudo systemctl daemon-reexec
    sudo systemctl daemon-reload
    sudo systemctl enable $GUNICORN_SERVICE
    echo "✅ Gunicorn systemd service created."
else
    echo "✅ Gunicorn service file already exists. Skipping creation."
fi

# === Step 5: Start/Restart Gunicorn Service ===
echo "🚀 Starting or restarting Gunicorn..."
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service || { echo "❌ Failed to restart Gunicorn service."; }

# === Step 6: Create Nginx Config (Skip if exists) ===
if [ ! -f "$NGINX_FILE" ]; then
    echo "🌐 Creating Nginx config..."

    sudo bash -c "cat > $NGINX_FILE" <<EOF
server {
    listen 80;
    server_name 172.27.226.245;

    location / {
 sudo systemctl restart apistudio.service        proxy_pass http://172.27.226.245:$GUNICORN_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

    echo "✅ Nginx config created."
else
    echo "✅ Nginx config already exists. Skipping creation."
fi

# === Step 8: Reload Nginx ===
echo "♻️ Reloading Nginx..."
sudo nginx -t && sudo systemctl restart nginx || { echo "❌ Nginx reload failed."; exit 1; }

# === Step 9: Status Checks ===
echo "📄 Gunicorn Status:"
sudo systemctl status $GUNICORN_SERVICE --no-pager || echo "⚠️ Gunicorn may not be running properly"

echo "📄 Nginx Status:"
sudo systemctl status nginx --no-pager || echo "⚠️ Nginx may not be running properly"

# === Step 10: Open Browser ===
APP_URL="http://172.27.226.245"
echo "🌍 Opening $APP_URL in browser..."
$BROWSER_COMMAND $APP_URL 2>/dev/null || echo "❗ Could not auto-open browser. Visit manually: $APP_URL:$GUNICORN_PORT"

echo "✅ All done! Your Django app is now running at $APP_URL:$GUNICORN_PORT"

exit 0
