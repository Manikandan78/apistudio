#!/bin/bash

set -e

# === Configurations ===
DOMAIN="studio.colleges91.com"
PROJECT_DIR="$HOME/API-STUDIO/ApiStudio/"  # Update this if needed
USER_NAME=$USER
VENV_DIR="$PROJECT_DIR/venv"
DJANGO_PORT=8005
ETLSTUDIO_PORT=5035
DATAMIGS_PORT=8012
GUNICORN_SOCKET="/run/gunicorn_apistudio.sock"
NGINX_CONF="/etc/nginx/sites-available/apistudio"

# === Step 1: Ensure necessary packages are installed ===
sudo apt update
sudo apt install python3-venv python3-pip nginx certbot python3-certbot-nginx -y

# === Step 2: Setup Python virtual environment ===
cd "$PROJECT_DIR"
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt  # Assumes requirements.txt exists

# === Step 3: Collect static files ===
python manage.py collectstatic --noinput

# === Step 4: Create Gunicorn service ===
echo "Creating gunicorn service..."
sudo bash -c "cat > /etc/systemd/system/gunicorn_apistudio.service" <<EOF
[Unit]
Description=gunicorn daemon for apistudio
After=network.target

[Service]
User=$USER_NAME
Group=www-data
WorkingDirectory=$PROJECT_DIR
ExecStart=$VENV_DIR/bin/gunicorn --access-logfile - --workers 3 --bind 127.0.0.1:$DJANGO_PORT apistudio.wsgi:application

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl start gunicorn_apistudio
sudo systemctl enable gunicorn_apistudio

# === Step 5: Create Nginx config ===
echo "Creating Nginx config..."
sudo bash -c "cat > $NGINX_CONF" <<EOF
server {
    if (\$host = $DOMAIN) {
        return 301 https://\$host\$request_uri;
    }
    listen 80;
    server_name $DOMAIN;
    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name $DOMAIN;

    location / {
        proxy_pass http://127.0.0.1:$DJANGO_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /etlstudio {
        proxy_pass http://127.0.0.1:$ETLSTUDIO_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /data-migs {
        proxy_pass http://127.0.0.1:$DATAMIGS_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;
}
EOF

# === Step 6: Enable and test Nginx ===
sudo ln -sf $NGINX_CONF /etc/nginx/sites-enabled/apistudio
sudo nginx -t
sudo systemctl restart nginx

# === Step 7: Obtain SSL cert if not already ===
if [ ! -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]; then
    echo "Obtaining SSL certificate via Certbot..."
    sudo certbot --nginx -d $DOMAIN
else
    echo "SSL certificate already exists, skipping Certbot..."
fi

echo "✅ All done! Project running at: https://$DOMAIN"
