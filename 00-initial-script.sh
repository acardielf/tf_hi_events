#!/bin/bash
echo "Hello World! I'm starting up now at $(date -R)!"

git clone https://github.com/HiEventsDev/hi.events.git /root/hi.events
cd /root/hi.events/docker/all-in-one

JWT_SECRET_CALC=$(openssl rand -base64 32)
APP_KEY_CALC="$(openssl rand -base64 32)"
APP_DOMAIN="inscripcion.candeladebuena.com"
VITE_FRONTEND_URL=https://$APP_DOMAIN
VITE_API_URL_CLIENT=https://$APP_DOMAIN/api
VITE_API_URL_SERVER=https://$APP_DOMAIN/api
APP_CDN_URL=http://$APP_DOMAIN/storage
APP_FRONTEND_URL=http://$APP_DOMAIN

sed -i "s|^APP_KEY=.*|APP_KEY=\"base64:$APP_KEY_CALC\"|" .env
sed -i "s|^JWT_SECRET=.*|JWT_SECRET=\"$JWT_SECRET_CALC\"|" .env

sed -i "s|^VITE_FRONTEND_URL=http://localhost:8123.*|VITE_FRONTEND_URL=\"$VITE_FRONTEND_URL\"|" .env
sed -i "s|^VITE_API_URL_CLIENT=http://localhost:8123/api.*|VITE_API_URL_CLIENT=\"$VITE_API_URL_CLIENT\"|" .env
sed -i "s|^VITE_API_URL_SERVER=http://localhost:80/api.*|VITE_API_URL_SERVER=\"$VITE_API_URL_SERVER\"|" .env

sed -i "s|^APP_CDN_URL=http://localhost:8123/storage.*|APP_CDN_URL=\"$APP_CDN_URL\"|" .env
sed -i "s|^APP_FRONTEND_URL=http://localhost:8123.*|APP_FRONTEND_URL=\"$APP_FRONTEND_URL\"|" .env