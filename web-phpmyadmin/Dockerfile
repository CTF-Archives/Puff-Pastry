FROM phpmyadmin/phpmyadmin:fpm-alpine

WORKDIR /var/www/html

USER root

RUN rm LICENSE ChangeLog README 
RUN rm -r doc
RUN echo "" >> robots.txt
RUN echo "database's hostname is db-mysql" >> robots.txt

CMD ["php-fpm","-R"]