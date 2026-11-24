
FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo_mysql

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

RUN printf '<Directory /var/www/html>\nOptions FollowSymLinks\nAllowOverride All\nRequire all granted\nDirectoryIndex index.php index.html\n</Directory>\n' >> /etc/apache2/apache2.conf

EXPOSE 80
