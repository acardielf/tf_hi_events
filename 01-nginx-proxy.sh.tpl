#!/bin/bash

mkdir -p /root/nginx-proxy-manager

DEST_FILE="/root/nginx-proxy-manager/docker-compose.yml"

cat > "$DEST_FILE" <<EOL
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
    environment:
      INITIAL_ADMIN_EMAIL: "${nginx_user}"
      INITIAL_ADMIN_PASSWORD: "${nginx_password}"
    volumes:
      - /root/nginx-proxy-manager/data:/data
      - /root/nginx-proxy-manager/letsencrypt:/etc/letsencrypt
EOL

echo "Archivo generado en $DEST_FILE"