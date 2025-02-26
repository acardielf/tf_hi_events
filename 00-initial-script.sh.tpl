#!/bin/bash
echo "Hello World! I'm starting up now at $(date -R)!"

# git clone -b "v1.0.0-alpha" https://github.com/HiEventsDev/hi.events.git /root/hi.events
git clone -b "v1.0.0-alpha" https://github.com/acardielf/Hi.Events.git  /root/hi.events
cd /root/hi.events/docker/all-in-one

JWT_SECRET_CALC=$(openssl rand -base64 32)
APP_KEY_CALC="$(openssl rand -base64 32)"
APP_DOMAIN=${app_domain}
VITE_FRONTEND_URL=https://${app_domain}
VITE_API_URL_CLIENT=https://${app_domain}/api
VITE_API_URL_SERVER=https://${app_domain}/api
APP_CDN_URL=https://${app_domain}/storage
APP_FRONTEND_URL=https://${app_domain}

MAIL_MAILER=smtp
MAIL_HOST="${app_mail_host}"
MAIL_PORT="${app_mail_port}"
MAIL_USERNAME="${app_mail_username}"
MAIL_PASSWORD="${app_mail_password}"
MAIL_ENCRYPTION="${app_mail_encryption}"
MAIL_FROM_ADDRESS="${app_mail_from_email}"
MAIL_FROM_NAME="${app_mail_from_name}"

sed -i "s|^APP_KEY=.*|APP_KEY=\"base64:$APP_KEY_CALC\"|" .env
sed -i "s|^JWT_SECRET=.*|JWT_SECRET=\"$JWT_SECRET_CALC\"|" .env

sed -i "s|^VITE_FRONTEND_URL=http://localhost:8123.*|VITE_FRONTEND_URL=\"$VITE_FRONTEND_URL\"|" .env
sed -i "s|^VITE_API_URL_CLIENT=http://localhost:8123/api.*|VITE_API_URL_CLIENT=\"$VITE_API_URL_CLIENT\"|" .env
sed -i "s|^VITE_API_URL_SERVER=http://localhost:80/api.*|VITE_API_URL_SERVER=\"$VITE_API_URL_SERVER\"|" .env

sed -i "s|^APP_CDN_URL=http://localhost:8123/storage.*|APP_CDN_URL=\"$APP_CDN_URL\"|" .env
sed -i "s|^APP_FRONTEND_URL=http://localhost:8123.*|APP_FRONTEND_URL=\"$APP_FRONTEND_URL\"|" .env

sed -i "s|^VITE_API_URL_SERVER=http://localhost:80/api.*|VITE_API_URL_SERVER=\"$VITE_API_URL_SERVER\"|" .env


echo "MAIL_MAILER=\"$MAIL_MAILER\"" >> .env
echo "MAIL_HOST=\"$MAIL_HOST\"" >> .env
echo "MAIL_PORT=\"$MAIL_PORT\"" >> .env
echo "MAIL_USERNAME=\"$MAIL_USERNAME\"" >> .env
echo "MAIL_PASSWORD=\"$MAIL_PASSWORD\"" >> .env
echo "MAIL_ENCRYPTION=\"$MAIL_ENCRYPTION\"" >> .env
echo "MAIL_FROM_ADDRESS=\"$MAIL_FROM_ADDRESS\"" >> .env
echo "MAIL_FROM_NAME=\"$MAIL_FROM_NAME\"" >> .env

