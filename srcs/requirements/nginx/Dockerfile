FROM debian:11.8

RUN apt-get update 2> /dev/null
RUN apt-get install -y nginx openssl 2> /dev/null
RUN apt-get purge apache2 -y

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY ./tools/nginx_www.sh /var/www

RUN chmod +x /var/www/nginx_www.sh

ENTRYPOINT [ "var/www/nginx_www.sh" ]

CMD ["nginx", "-g", "daemon off;"]
