#! /bin/bash
service mariadb start

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]
then
	mysql --user=$MYSQL_ROOT_USER --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
	mysql -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u $MYSQL_ROOT_USER --password=$MYSQL_ROOT_PASSWORD shutdown

mysqld
