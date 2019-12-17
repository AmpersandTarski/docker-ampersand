ARG AMPERSAND_IMAGE_VERSION=latest
FROM docker.pkg.github.com/ampersandtarski/ampersand/ampersand:${AMPERSAND_IMAGE_VERSION} as compiler

FROM ampersandtarski/prototype-base:latest

COPY --from=compiler /bin/ampersand /usr/local/bin
RUN chmod +x /usr/local/bin/ampersand

ADD . /src

ARG AMPERSAND_DB_HOST=db
ARG AMPERSAND_SCRIPT=script.adl

# Generate prototype application from folder
RUN ampersand /src/${AMPERSAND_SCRIPT} --proto=/var/www/html --sqlHost=${AMPERSAND_DB_HOST} --verbose --skip-composer \
  && cd /var/www/html \
  && composer install --prefer-dist --no-dev --profile \
  # && npm install \
  # && gulp build-ampersand \
  # && gulp build-project