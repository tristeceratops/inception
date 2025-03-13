#!/bin/sh

sleep 10

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp cli update
	wp core download --path="/var/www/wordpress" --allow-root

	wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost=mariadb:3306 --allow-root --path="/var/www/wordpress"

	wp core install --title="SummeryLeak" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --skip-email --allow-root --url="ewoillar.42.fr" --path="/var/www/wordpress"

	wp user create $USER_LOGIN $USER_EMAIL --path="/var/www/wordpress" --allow-root
fi

exec php-fpm7.4 -F
