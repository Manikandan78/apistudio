#!/bin/bash

# Define domain name
DOMAIN="api.nanoxstudio.com"

# Install Nginx if not installed
echo "Installing Nginx..."
sudo apt update
sudo apt install -y nginx

# Start and enable Nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

# Create Nginx configuration file
echo "Configuring Nginx for $DOMAIN..."

NGINX_CONF="/etc/nginx/sites-available/nanox-api-studio"

sudo bash -c "cat > $NGINX_CONF" <<EOL
server {
    listen 80;
    server_name $DOMAIN;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location /core {
        proxy_pass http://127.0.0.1:8007;
    }

    location /datamigration {
        proxy_pass http://127.0.0.1:8002;
    }

    location /getapi {
        proxy_pass http://127.0.0.1:8001;
    }

    location /authentication {
        proxy_pass http://127.0.0.1:8011;
    }

    location /crudapp {
        proxy_pass http://127.0.0.1:8000;
    }

    location /deleteapi {
        proxy_pass http://127.0.0.1:8004;
    }

    location /postapi {
        proxy_pass http://127.0.0.1:8002;
    }

    location /sqlviews {
        proxy_pass http://127.0.0.1:8009;
    }

    location /cmspage { 
        proxy_pass http://127.0.0.1:8008;
    }

    location /dbschemaapi {
        proxy_pass http://127.0.0.1:8006;
    }

    location /updateapi {
        proxy_pass http://127.0.0.1:8003;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOL

# Enable Nginx configuration
echo "Enabling Nginx configuration..."
sudo ln -sf $NGINX_CONF /etc/nginx/sites-enabled/

# Test Nginx configuration
echo "Testing Nginx configuration..."
sudo nginx -t

# Restart Nginx to apply changes
echo "Restarting Nginx..."
sudo systemctl restart nginx

echo "Nginx setup completed successfully!"

# Optional: Setup SSL with Let's Encrypt
read -p "Do you want to enable SSL with Certbot? (y/n): " SSL_CHOICE
if [[ "$SSL_CHOICE" == "y" ]]; then
    sudo apt install -y certbot python3-certbot-nginx
    sudo certbot --nginx -d $DOMAIN
    echo "SSL setup completed!"
fi

echo "All done! Your APIs are now running through Nginx."
