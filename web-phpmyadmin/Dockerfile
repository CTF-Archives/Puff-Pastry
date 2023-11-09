FROM phpmyadmin/phpmyadmin

WORKDIR /var/www/html

RUN rm LICENSE ChangeLog README 
RUN rm -r doc
RUN echo "" >> robots.txt
RUN echo "database's hostname is db-mysql" >> robots.txt