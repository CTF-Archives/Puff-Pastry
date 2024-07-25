#!/bin/sh

rm -f /docker-entrypoint.sh

php-fpm & nginx &

echo "Running..."

tail -F /var/log/nginx/access.log /var/log/nginx/error.log