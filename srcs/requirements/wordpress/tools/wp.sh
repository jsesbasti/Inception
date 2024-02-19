#!/bin/bash

if [ ! -f ./wp-config.php ]
then

	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php &> /dev/null
    wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css &> /dev/null

	wp core download --allow-root
	wp config create --allow-root --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --dbhost="${MYSQL_HOSTNAME}"
	wp core install --allow-root --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIM_PASS}"  --admin_email="${WP_ADMIM_EMAIL}"
	wp user create ${WP_USER} ${WP_EMAIL} --role='author' --user_pass="${WP_USER_PASS}" --allow-root
	wp user create ${WP_ADMIN} ${WP_ADMIM_EMAIL} --role='author' --user_pass="${WP_ADMIN_PASS}" --allow-root
	wp theme install inspiro --activate --allow-root

    # enable redis cache
    sed -i "40i define( 'WP_REDIS_HOST', '$WP_REDIS_HOST' );"   wp-config.php
    sed -i "41i define( 'WP_REDIS_PORT', $WP_REDIS_PORT );"     wp-config.php
    #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
    sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
    sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
    sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php
	
	wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
fi

wp redis enable --allow-root

/usr/sbin/php-fpm7.4 -F;