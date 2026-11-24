
FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo_mysql

RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

COPY --chown=www-data:www-data . /var/www/html/

RUN chmod -R 755 /var/www/html/

EXPOSE 80
