FROM php:8.2-apache

# Instala ferramentas de download/extração e extensões MySQL exigidas pelo WordPress
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    tar \
    unzip \
    libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip \
    && a2enmod rewrite \
    && curl -fSL https://wordpress.org/latest.tar.gz -o /tmp/wordpress.tar.gz \
    && tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 \
    && rm -f /tmp/wordpress.tar.gz \
    && rm -rf /var/lib/apt/lists/*

# Coloca sua aula interativa de PHP + Docker sem atropelar o index.php do WordPress
COPY lab.php /var/www/html/lab.php

# Garante permissão correta pro Apache (www-data)
RUN chown -R www-data:www-data /var/www/html
