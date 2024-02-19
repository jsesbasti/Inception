FROM debian:11.8

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y curl \
	php7.4-fpm \
	php7.4-mysqli \
	mariadb-client \
	lsb-release gpg

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

CMD ["curl", "-fsSL", "https://packages.redis.io/gpg", "|", "gpg", "--dearmor", "-o", "/usr/share/keyrings/redis-archive-keyring.gpg"]

CMD ["echo", "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main", "|", "tee", "/etc/apt/sources.list.d/redis.list"]

RUN apt-get update
RUN apt-get install redis

RUN mkdir -p /run/php
RUN chmod 755 /run/php

COPY ./tools/wp.sh /usr/local/bin/wp.sh
RUN chmod +x /usr/local/bin/wp.sh

EXPOSE 9000

WORKDIR /var/www/html/

ENTRYPOINT [ "/usr/local/bin/wp.sh" ]
