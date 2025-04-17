#!/bin/bash

# Exit on error
set -e

# Define variables
PROJECT_NAME="ApiStudio"
PROJECT_DIR="/home/mani/API-STUDIO/ApiStudio"
VENV_PATH="$PROJECT_DIR/venv"
GUNICORN_SOCKET="/run/$PROJECT_NAME.sock"
GUNICORN_SERVICE="/etc/systemd/system/gunicorn-$PROJECT_NAME.service"
NGINX_SITE="/etc/nginx/sites-available/$PROJECT_NAME"
NGINX_LINK="/etc/nginx/sites-enabled/$PROJECT_NAME"

echo "Checking and installing required packages..."

# Install Nginx if not installed
if ! command -v nginx >/dev/null 2>&1; then
  echo "Installing Nginx..."
  sudo apt update
  sudo apt install -y nginx
else
  echo " Nginx is already installed"
fi

# Install Gunicorn if not installed in virtualenv
if [ ! -f "$VENV_PATH/bin/gunicorn" ]; then
  echo "Installing Gunicorn in virtual environment..."
  source "$VENV_PATH/bin/activate"
  pip install gunicorn
  sudo apt install gunicorn
  deactivate
else
  echo " Gunicorn is already installed in virtualenv"
fi

# Create Gunicorn systemd service
echo "Setting up Gunicorn systemd service..."
sudo tee "$GUNICORN_SERVICE" > /dev/null <<EOF
[Unit]
Description=gunicorn daemon for $PROJECT_NAME
After=network.target

[Service]
User=mani
Group=www-data
WorkingDirectory=$PROJECT_DIR
ExecStart=$VENV_PATH/bin/gunicorn --workers 3 --bind unix:$GUNICORN_SOCKET $PROJECT_NAME.wsgi:application
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable gunicorn-$PROJECT_NAME
sudo systemctl restart gunicorn-$PROJECT_NAME

# Setup Nginx config
echo " Configuring Nginx..."
sudo tee "$NGINX_SITE" > /dev/null <<EOF
server {
#!/bin/bash

# Exit on error
set -e

# Define variables
PROJECT_NAME="apistudio"
PROJECT_DIR="/home/mani/API-STUDIO/ApiStudio"
VENV_PATH="$PROJECT_DIR/venv"
GUNICORN_SOCKET="/run/$PROJECT_NAME.sock"
GUNICORN_SERVICE="/etc/systemd/system/gunicorn-$PROJECT_NAME.service"
NGINX_SITE="/etc/nginx/sites-available/$PROJECT_NAME"
NGINX_LINK="/etc/nginx/sites-enabled/$PROJECT_NAME"

echo "Checking and installing required packages..."

# Install Nginx if not installed
if ! command -v nginx >/dev/null 2>&1; then
  echo "Installing Nginx..."
  sudo apt update
  sudo apt install -y nginx
else
  echo " Nginx is already installed"
fi

# Install Gunicorn if not installed in virtualenv
if [ ! -f "$VENV_PATH/bin/gunicorn" ]; then
  echo "Installing Gunicorn in virtual environment..."
  source "$VENV_PATH/bin/activate"
  pip install gunicorn
  deactivate
else
  echo " Gunicorn is already installed in virtualenv"
fi

# Create Gunicorn systemd service
echo " Setting up Gunicorn systemd service..."
sudo tee "$GUNICORN_SERVICE" > /dev/null <<EOF
[Unit]
Description=gunicorn daemon for $PROJECT_NAME
After=Network.target

[Service]
User=mani
Group=www-data
WorkingDirectory=$PROJECT_DIR
ExecStart=$VENV_PATH/bin/gunicorn --workers 3 --bind unix:$GUNICORN_SOCKET $PROJECT_NAME.wsgi:application
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable gunicorn-$PROJECT_NAME
sudo systemctl restart gunicorn-$PROJECT_NAME

# Setup Nginx config
echo "➡️ Configuring Nginx..."
sudo tee "$NGINX_SITE" > /dev/null <<EOF
server {
    listen 80;
    server_name _;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root $PROJECT_DIR;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:$GUNICORN_SOCKET;
    }
}
EOF

# Enable site and restart Nginx
sudo ln -sf "$NGINX_SITE" "$NGINX_LINK"
sudo nginx -t && sudo systemctl restart nginx

echo " Nginx and Gunicorn are now configured and running for $PROJECT_NAME"
    listen 80;
    server_name _;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root $PROJECT_DIR;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:$GUNICORN_SOCKET;
    }
}
EOF

# Enable site and restart Nginx
sudo ln -sf "$NGINX_SITE" "$NGINX_LINK"
sudo nginx -t && sudo systemctl restart nginx

echo " Nginx and Gunicorn are now configured and running for $PROJECT_NAME"
