#!/bin/bash

# Define file paths
APISTUDIO_CONF="/etc/nginx/conf.d/apistudio.conf"
MICROAPI_CONF="/etc/nginx/conf.d/microapi.conf"

# Create apistudio.conf
cat <<EOF | sudo tee "$APISTUDIO_CONF"
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

# Create microapi.conf
cat <<EOF | sudo tee "$MICROAPI_CONF"
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

# Test and reload nginx
echo "Testing Nginx configuration..."
sudo nginx -t

if [ $? -eq 0 ]; then
    echo "Reloading Nginx..."
    sudo systemctl reload nginx
    echo "✅ Nginx configuration successfully applied!"
else
    echo "❌ Nginx configuration test failed. Please check the configs."
fi
