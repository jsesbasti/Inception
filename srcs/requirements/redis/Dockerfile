FROM debian:11.8

RUN apt-get update
RUN apt-get install -y redis

COPY /tools/configure.sh /usr/local/bin/configure.sh

RUN chmod 755 /usr/local/bin/configure.sh

ENTRYPOINT ["/usr/local/bin/configure.sh"]