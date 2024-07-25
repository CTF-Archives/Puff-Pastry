FROM phpmyadmin/phpmyadmin:fpm-alpine

# 安装必要的软件包
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --update --no-cache tar nginx mysql mysql-client bash

# 配置mysql
RUN docker-php-source extract && \
    docker-php-ext-install pdo_mysql mysqli && \
    docker-php-source delete && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
    sh -c 'mysqld_safe &' && \
    sleep 5s && \
    mysqladmin -uroot password 'root'

# 复制nginx+mysql配置文件
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/zzz-docker.conf /usr/local/etc/php-fpm.d/zzz-docker.conf
COPY ./config/docker-php-ext-mysqli.ini /usr/local/etc/php/conf.d
COPY ./config/docker-php-ext-pdo_mysql.ini /usr/local/etc/php/conf.d

WORKDIR /var/www/html

USER root

# 拷贝容器入口点脚本
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

USER root

# 设置容器入口点
ENTRYPOINT [ "/docker-entrypoint.sh" ]