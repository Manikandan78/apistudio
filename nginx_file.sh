#!/bin/bash

CONFIG_DIR="/etc/nginx/conf"
CONFIG_FILE="$CONFIG_DIR/microconfig.nginx"

# Create the config directory if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating directory: $CONFIG_DIR"
    sudo mkdir -p "$CONFIG_DIR"
fi

# Write the nginx config
echo "Writing Nginx configuration to $CONFIG_FILE"
sudo tee "$CONFIG_FILE" > /dev/null << 'EOF'
server {
    server_name api.colleges91.com;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /crudapp {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /getapi {
        proxy_pass http://127.0.0.1:8001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /postapi {
        proxy_pass http://127.0.0.1:8002;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /updateapi {
        proxy_pass http://127.0.0.1:8003;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /deleteapi {
        proxy_pass http://127.0.0.1:8004;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /db_schema_api {
        proxy_pass http://127.0.0.1:8006;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /coreapi {
        proxy_pass http://127.0.0.1:8007;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /cms {
        proxy_pass http://127.0.0.1:8008;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /sqlviews {
        proxy_pass http://127.0.0.1:8009;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    location /auth {
        proxy_pass http://127.0.0.1:8011;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 75s;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        keepalive_timeout 65;
    }

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/api.colleges91.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/api.colleges91.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}

server {
    if ($host = api.colleges91.com) {
        return 301 https://$host$request_uri;
    }
    server_name api.colleges91.com;
    listen 80;
    return 404;
}

server {
    if ($host = api.colleges91.com) {
        return 301 https://$host$request_uri;
    }
    server_name api.colleges91.com;
    listen 80;
    return 404;
}
EOF

# Set permissions
sudo chmod 644 "$CONFIG_FILE"
echo "Set permissions on $CONFIG_FILE"

# Test Nginx config
echo "Testing Nginx configuration..."
sudo nginx -t

# Reload Nginx if test passed
if [ $? -eq 0 ]; then
    echo "Reloading Nginx..."
    sudo systemctl reload nginx
else
    echo "Nginx configuration test failed. Fix errors and try again."
fi
