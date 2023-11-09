FROM php:7.3.33-fpm-bullseye 

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update && \ 
    apt-get -y install net-tools curl vsftpd python3 tar nginx sudo

RUN mkdir /run/nginx && \
    docker-php-source extract && \
    docker-php-source delete

RUN useradd -m admin && echo "admin:admin" && \
    echo "admin:admin" | chpasswd

RUN mkdir -p /var/run/vsftpd/empty

RUN chmod a-w /home/admin
# RUN chown admin:admin /app

COPY ./config/vsftpd.conf /etc/vsftpd.conf

COPY ./config/nginx.conf /etc/nginx/nginx.conf

COPY ./config/sudoers /etc/sudoers

COPY ./src /var/www/html

WORKDIR /var/www/html

COPY ./service/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 750 /docker-entrypoint.sh 

CMD ["/bin/bash", "-c", "/docker-entrypoint.sh"]