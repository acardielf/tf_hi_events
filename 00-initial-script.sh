#!/bin/bash
echo "Hello World! I'm starting up now at $(date -R)!"

git clone https://github.com/HiEventsDev/hi.events.git /root/hi.events
cd /root/hi.events/docker/all-in-one

JWT_SECRET_CALC=$(openssl rand -base64 32)
APP_KEY_CALC="$(openssl rand -base64 32)"

sed -i "s|^APP_KEY=.*|APP_KEY=\"base64:$APP_KEY_CALC\"|" .env
sed -i "s|^JWT_SECRET=.*|JWT_SECRET=\"$JWT_SECRET_CALC\"|" .env

