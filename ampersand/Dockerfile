FROM php:7-apache

ENV PATH="/usr/local/texlive/2016/bin/x86_64-linux:/root/.local/bin:${PATH}"
RUN apt-get update \
 && apt-get install -y git graphviz wget \
 && curl -sSL https://get.haskellstack.org/ | /bin/sh

# install texlive
ADD  texlive.profile /root
RUN cd ~ \
  && curl -SL http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  | tar -xvz \
  && cd ~/install-tl-* \
  && ./install-tl --profile=/root/texlive.profile

# clone git ampersand compiler repository
RUN mkdir ~/git \
 && cd ~/git \
 && git clone --branch development https://github.com/AmpersandTarski/Ampersand

# build the compiler
RUN cd ~/git/Ampersand \
 && stack setup \
 && stack install

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
 && php -r "unlink('composer-setup.php');"
 