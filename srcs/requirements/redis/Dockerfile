FROM debian:11.8

RUN apt-get update
RUN apt-get install -y redis

RUN chown -R redis:redis /var/lib/redis

COPY conf/redis.conf /etc/redis/redis_mod.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis/redis_mod.conf"]