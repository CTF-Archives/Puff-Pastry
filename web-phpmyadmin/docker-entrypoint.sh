#!/bin/bash

rm -f /docker-entrypoint.sh

mysqld_safe &

mysql_ready() {
	mysqladmin ping --socket=/run/mysqld/mysqld.sock --user=root --password=root > /dev/null 2>&1
}

while !(mysql_ready)
do
	echo "waiting for mysql ..."
	sleep 3
done

touch /etc/phpmyadmin/config.secret.inc.php

# 配置数据库数据
mysqld_safe &
sleep 5s
mysqladmin -uroot password '123456'
mysql -e "source /var/db.sql;" -uroot -p123456

php-fpm -R & nginx &

echo "Running..."

tail -F /var/log/nginx/access.log /var/log/nginx/error.log