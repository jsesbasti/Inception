FROM debian:11.8

RUN apt-get update
RUN apt-get install -y vsftpd ufw

EXPOSE 20 21 22 30000-30009

RUN cp /etc/vsftpd.conf /etc/vsftpd.conf.original

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/configure.sh /root/configure.sh

RUN chmod 777 /root/configure.sh

ENTRYPOINT [ "sh", "/root/configure.sh" ]
