# To run generated prototypes we require a apache webserver with php
FROM php:7.3-apache

# Install libzip to unpack prototype framework from github
RUN apt-get update \
  && apt-get install -y --no-install-recommends libzip-dev zlib1g-dev

# Install additional php/apache extensions
# enable ZipArchive for importing .xlsx files on runtime
RUN docker-php-ext-install mysqli zip\
 && a2enmod rewrite \
 # install composer (php's package manager)
 && php  -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
 && php -r "unlink('composer-setup.php');" \
 && rm -rf /var/lib/apt/lists/*

ENV COMPOSER_HOME /usr/local/bin/

# Enable Apache to write to www folder
RUN chown -R www-data:www-data /var/www