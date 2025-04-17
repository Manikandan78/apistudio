#!/usr/bin/env bash

DOMAIN="studio.colleges91.com"
EMAIL="manikandanperumal00@gmail.com"

echo "Stopping nginx so certbot can use port 80..."
sudo systemctl stop nginx

echo "Requesting certificate for $DOMAIN using standalone mode..."
sudo certbot certonly --standalone -d $DOMAIN --non-interactive --agree-tos -m $EMAIL

echo "Certificate generated at /etc/letsencrypt/live/$DOMAIN/"
echo "Restarting nginx..."
sudo systemctl start nginx

