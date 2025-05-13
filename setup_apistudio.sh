#!/bin/bash

PROJECT_DIR="$HOME/API-STUDIO/ApiStudio"
USER_NAME=$(whoami)

echo "📁 Project directory: $PROJECT_DIR"
echo "👤 Linux user: $USER_NAME"

# === Step 1: Create Gunicorn systemd service ===
echo "⚙️ Creating Gunicorn service..."

cat <<EOF | sudo tee /etc/systemd/system/gunicorn_apistudio.service > /dev/null
[Unit]
Description=Gunicorn daemon for ApiStudio
After=network.target

[Service]
User=$USER_NAME
Group=www-data
WorkingDirectory=$PROJECT_DIR
ExecStart=$PROJECT_DIR/venv/bin/gunicorn --workers 3 --bind 127.0.0.1:8005 apistudio.manage:application
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# === Step 2: Start and enable the Gunicorn service ===
echo "🚀 Starting Gunicorn..."
sudo systemctl daemon-reload
sudo systemctl enable gunicorn_apistudio
sudo systemctl start gunicorn_apistudio
sudo systemctl status gunicorn_apistudio | grep Active

# === Step 3: Create Nginx config file ===
echo "🌐 Creating Nginx site config..."

cat <<EOF | sudo tee /etc/nginx/sites-available/apistudio > /dev/null
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8005;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

# === Step 4: Enable the site ===
echo "🔗 Linking Nginx config..."
sudo ln -sf /etc/nginx/sites-available/apistudio /etc/nginx/sites-enabled/apistudio

# === Step 5: Test and reload Nginx ===
echo "🧪 Testing Nginx config..."
sudo nginx -t

echo "🔁 Reloading Nginx..."
sudo systemctl reload nginx

echo "✅ Django app should now be live at: http://127.0.0.1:8005"
