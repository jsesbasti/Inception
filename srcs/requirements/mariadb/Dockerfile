FROM debian:11.8

RUN apt-get update 2> /dev/null
RUN apt-get install -y mariadb-server 2> /dev/null

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld

RUN touch /var/run/mysqld/mysqld.sock

RUN touch /var/run/mysqld/mysqld.pid

RUN chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN chmod 755 /usr/local/bin/mariadb.sh

RUN mysql_install_db --socket=/var/run/mysqld/mysqld.sock

ENTRYPOINT ["sh", "/usr/local/bin/mariadb.sh"]
