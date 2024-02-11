#!/bin/bash

if [ -f ./wp-config.php ]
then
	echo "Wordpress already exists"
else
	wp core download --allow-root

	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root

	wp core install --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIM --admin_password=$WP_ADMIM_PASS  --admin_email=$WP_ADMIM_EMAIL --skip-email --allow-root

	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root

	wp theme install astra --activate --allow-root
fi

/usr/sbin/php-fpm7.4 -F;