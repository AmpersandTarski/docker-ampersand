FROM php:7-apache

# install required packages and composer
RUN apt-get update \
 && apt-get install -y --no-install-recommends git graphviz wget vim less \
 && curl -sSL https://get.haskellstack.org/ | /bin/sh \
 && docker-php-ext-install mysqli \
 && a2enmod rewrite \
 && rm -rf /var/lib/apt/lists/* \
 && php  -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
 && php -r "unlink('composer-setup.php');"

ENV COMPOSER_HOME /usr/local/bin/

# install texlive from iso
ENV PATH /texlive/bin/x86_64-linux:$PATH
ADD texlive.profile /tmp
RUN cd ~ \
 && curl http://ctan.mirrors.hoobly.com/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -vxz \
 && cd install-tl* \
 && ./install-tl -profile /tmp/texlive.profile \
 && rm -rf install-tl* \
 && rm /tmp/texlive.profile

# clone git ampersand compiler repository
RUN mkdir ~/git \
 && cd ~/git \
 && git clone --depth=1 --branch development https://github.com/AmpersandTarski/Ampersand \
 && cd ~/git/Ampersand \
 && stack setup \
 && stack install --local-bin-path /usr/local/bin
