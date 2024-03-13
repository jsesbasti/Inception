#!/bin/bash

service vsftpd start
service ufw start

folder="/home/hostinger/ftp/files"

if [ ! -d "$folder" ]; then
    mkdir -p "$folder"
fi

ufw enable 
ufw allow 20/tcp 
ufw allow 21/tcp 
ufw allow 22/tcp 
ufw allow 30000:30003/tcp 
ufw allow 30000:30003/udp
