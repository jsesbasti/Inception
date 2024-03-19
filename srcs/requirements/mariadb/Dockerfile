FROM debian:11.8

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN chmod 755 /usr/local/bin/mariadb.sh

RUN mysql_install_db

ENTRYPOINT ["sh", "/usr/local/bin/mariadb.sh"]
