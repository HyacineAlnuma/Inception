#!/bin/bash
set -e

if [ ! -f "wp-config.php" ]; then
    wp core download --allow-root

    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost="$DB_HOST" \
        --allow-root

    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$SITE_TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    wp user create "$USER_LOGIN" "$USER_EMAIL" \
        --role=author \
        --user_pass="$USER_PASSWORD" \
        --allow-root
fi

sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

mkdir -p /run/php

exec /usr/sbin/php-fpm8.2 -F