#!/bin/bash

set -e  # Exit if any command fails

echo "🔧 Starting APIStudio Deployment..."

# Step 0: Variables
SERVICE_PATH="/etc/systemd/system/apistudio.service"
PROJECT_DIR="$HOME/API-STUDIO/ApiStudio"
GUNICORN_EXEC="$PROJECT_DIR/venv/bin/gunicorn"
NGINX_CONF="/etc/nginx/sites-available/apistudio"
DOMAIN="studio.colleges91.com"
EMAIL="admin@colleges91.com"  # Change this to your real email
CERT_PATH="/etc/letsencrypt/live/$DOMAIN/fullchain.pem"

# Step 1: Create systemd service file for Gunicorn
if [ ! -f "$SERVICE_PATH" ]; then
  echo "🛠️ Creating systemd service for Gunicorn..."
  sudo bash -c "cat > $SERVICE_PATH" <<EOF
[Unit]
Description=API Studio Django App
After=network.target

[Service]
User=root
WorkingDirectory=$PROJECT_DIR
ExecStart=$GUNICORN_EXEC --workers 3 --bind 127.0.0.1:8005 ApiStudio.wsgi:application
Restart=always

[Install]
WantedBy=multi-user.target
EOF
  echo "✅ Systemd service created."
else
  echo "⚠️ Systemd service already exists. Skipping."
fi

# Step 2: Start and enable Gunicorn
echo "🚀 Starting Gunicorn service..."
sudo systemctl daemon-reload
sudo systemctl restart apistudio
sudo systemctl enable apistudio
echo "✅ Gunicorn service running."

# Step 3: Create Nginx config
if [ ! -f "$NGINX_CONF" ]; then
  echo "🌐 Creating Nginx config..."
  sudo bash -c "cat > $NGINX_CONF" <<EOF
server {
    listen 80;
    server_name $DOMAIN;

    location / {
        proxy_pass http://127.0.0.1:8005;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF
else
  echo "⚠️ Nginx config already exists. Skipping."
fi

# Step 4: Enable Nginx config and reload
echo "🔁 Enabling site and reloading Nginx..."
sudo ln -sf "$NGINX_CONF" /etc/nginx/sites-enabled/apistudio
sudo nginx -t && sudo systemctl reload nginx
echo "✅ Nginx configuration tested and reloaded."

# Step 5: SSL Certificate Setup
echo "🔒 Checking for existing SSL certificate..."

if [ -f "$CERT_PATH" ]; then
  EXPIRY_DATE=$(openssl x509 -enddate -noout -in "$CERT_PATH" | cut -d= -f2)
  EXPIRY_SECS=$(date -d "$EXPIRY_DATE" +%s)
  NOW_SECS=$(date +%s)
  DAYS_LEFT=$(( (EXPIRY_SECS - NOW_SECS) / 86400 ))

  echo "📅 Certificate valid for $DAYS_LEFT more days."

  if [ "$DAYS_LEFT" -lt 10 ]; then
    echo "⚠️ Certificate is expiring soon. Renewing..."
    sudo certbot renew --nginx --quiet
  else
    echo "✅ SSL certificate is still valid. Skipping renewal."
  fi
else
  echo "🆕 No certificate found. Installing Certbot and issuing SSL..."
  sudo apt update
  sudo apt install -y certbot python3-certbot-nginx
  sudo certbot --nginx -d "$DOMAIN" --non-interactive --agree-tos --email "$EMAIL" --redirect
fi

echo "🎉 Deployment finished! App is live at https://$DOMAIN"
