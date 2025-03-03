#!/bin/sh

sleep 10

# Créer la configuration WordPress
wp config create \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress/' --allow-root

# Installer le coeur de WordPress
wp core install \
    --title="SummeryLeak" \
    --admin_user=$ADMIN_USER \
    --admin_password=$ADMIN_PASSWORD \
    --admin_email=$ADMIN_EMAIL \
    --skip-email --path='/var/www/wordpress/' --allow-root

# Créer un utilisateur WordPress
wp user create $USER_LOGIN $USER_EMAIL --path='/var/www/wordpress/' --allow-root

