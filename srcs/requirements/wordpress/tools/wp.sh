#!/bin/bash

if [ ! -f ./wp-config.php ]
then
	wp core download --allow-root
	wp config create --allow-root --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --dbhost="${MYSQL_HOSTNAME}"
	wp core install --allow-root --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PASS}"  --admin_email="${WP_ADMIN_EMAIL}"
	wp user create ${WP_USER} ${WP_EMAIL} --role='author' --user_pass="${WP_USER_PASS}" --allow-root
	wp theme install astra --activate --allow-root
fi

/usr/sbin/php-fpm7.4 -F;
