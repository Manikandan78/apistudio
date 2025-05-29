#!/usr/bin/env bash

set -e

# === 1. Check and install Nginx if not installed ===
echo "Checking for Nginx..."
if ! command -v nginx &> /dev/null; then
  echo " Nginx not found. Installing..."
  sudo apt update
  sudo apt install -y nginx
else
  echo " Nginx is already installed."
fi

# === 2. Define config directory and file paths ===
NGINX_CONF_DIR="/etc/nginx/conf.d"
APISTUDIO_CONF="${NGINX_CONF_DIR}/apistudio.conf"
MICROAPI_CONF="${NGINX_CONF_DIR}/microapi.conf"

# === 3. Create apistudio.conf ===
echo " Creating apistudio.conf..."
sudo tee "$APISTUDIO_CONF" > /dev/null <<EOF
server {
    listen 80;

    location / {
        proxy_pass http://127.0.0.1:8005;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location /etlstudio {
        proxy_pass http://127.0.0.1:5035;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location /data-migs {
        proxy_pass http://127.0.0.1:8012;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

# === 4. Create microapi.conf ===
echo "📝 Creating microapi.conf..."
sudo tee "$MICROAPI_CONF" > /dev/null <<EOF
server {
    listen 80;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location /crudapp {
        proxy_pass http://127.0.0.1:8000;
        include proxy_params;
    }

    location /getapi {
        proxy_pass http://127.0.0.1:8001;
        include proxy_params;
    }

    location /postapi {
        proxy_pass http://127.0.0.1:8002;
        include proxy_params;
    }

    location /updateapi {
        proxy_pass http://127.0.0.1:8003;
        include proxy_params;
    }

    location /deleteapi {
        proxy_pass http://127.0.0.1:8004;
        include proxy_params;
    }

    location /db_schema_api {
        proxy_pass http://127.0.0.1:8006;
        include proxy_params;
    }

    location /coreapi {
        proxy_pass http://127.0.0.1:8007;
        include proxy_params;
    }

    location /cms {
        proxy_pass http://127.0.0.1:8008;
        include proxy_params;
    }

    location /sqlviews {
        proxy_pass http://127.0.0.1:8009;
        include proxy_params;
    }

    location /auth {
        proxy_pass http://127.0.0.1:8011;
        include proxy_params;
    }
}
EOF

# === 5. Test and restart Nginx ===
echo " Testing Nginx configuration..."
sudo nginx -t

echo " Restarting Nginx..."
sudo systemctl restart nginx

echo ""
echo " Nginx setup and configuration complete!"
echo "🗂️ Config files:"
echo " - $APISTUDIO_CONF"
echo " - $MICROAPI_CONF"
