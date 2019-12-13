# To run generated prototypes we require a apache webserver with php
FROM php:7.3-apache

RUN apt update;apt install -y libzip-dev zlib1g-dev

# Install additional php/apache extensions
# enable ZipArchive for importing .xlsx files on runtime
RUN docker-php-ext-install mysqli zip\
 && a2enmod rewrite

RUN chown -R www-data:www-data /var/www