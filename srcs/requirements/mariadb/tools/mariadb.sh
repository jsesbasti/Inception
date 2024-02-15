#! /bin/bash
sudo service mariadb start

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]
then
	mysql -u ${MYSQL_ROOT_USER} --password=${MYSQL_ROOT_PASSWORD} < /usr/local/bin/initial_db.sql
fi

mysqld
