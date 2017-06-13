FROM php:7-apache

ENV PATH /texlive/bin/x86_64-linux:$PATH
RUN apt-get update \
 && apt-get install -y --no-install-recommends git graphviz wget xorriso \
 && curl -sSL https://get.haskellstack.org/ | /bin/sh \
 && rm -rf /var/lib/apt/lists/*

# install texlive from iso
ENV TL_VERSION 2017-20170524
ADD texlive.profile /tmp
RUN cd ~ \
 && wget -q   http://mirrors.ctan.org/systems/texlive/Images/texlive$TL_VERSION.iso \
 && wget -qO- http://mirrors.ctan.org/systems/texlive/Images/texlive$TL_VERSION.iso.sha512 | sha512sum -c \
 && osirrox -report_about NOTE -indev texlive$TL_VERSION.iso -extract / /usr/src/texlive \
 && rm texlive$TL_VERSION.iso \
 && /usr/src/texlive/install-tl -profile /tmp/texlive.profile \
 && rm -rf /usr/src/texlive \
 && rm /tmp/texlive.profile

# clone git ampersand compiler repository
RUN mkdir ~/git \
 && cd ~/git \
 && git clone --branch development https://github.com/AmpersandTarski/Ampersand

# build the compiler
RUN cd ~/git/Ampersand \
 && stack setup \
 && stack install --local-bin-path /usr/local/bin

# install composer
ENV COMPOSER_HOME=/usr/local/bin/
RUN php  -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
 && php -r "unlink('composer-setup.php');"
 
# install mysqli for php & enable mod_rewrite for apache
RUN docker-php-ext-install mysqli \
 && a2enmod rewrite
