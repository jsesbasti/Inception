FROM debian:11.8

RUN apt-get update
RUN apt-get install -y vsftpd ufw

RUN cp /etc/vsftpd.conf /etc/vsftpd.conf.original

RUN adduser hostinger

RUN mkdir -p /home/hostinger/ftp

RUN chmod a-w /home/hostinger/ftp

COPY conf/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT [ "" ]
