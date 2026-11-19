# Fixa uma versão real do WordPress + PHP 8.2 + Apache
FROM wordpress:6.7.1-php8.2-apache

RUN a2enmod rewrite
COPY index.php /var/www/html/index.php
COPY css/ /var/www/html/css/
RUN chown -R www-data:www-data /var/www/html

