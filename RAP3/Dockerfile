FROM ampersand:latest

# build RAP3 application by cloning the models repository
RUN mkdir -p ~/git \
 && cd ~/git \
 && git clone --branch master https://github.com/AmpersandTarski/Ampersand-models \
 && ampersand --meta-tables --add-semantic-metamodel -p/var/www/html/RAP3 ~/git/Ampersand-models/RAP3/RAP3.adl --verbose \
 && mkdir -p /var/www/html/RAP3/log \
 && chown -R www-data:www-data /var/www/html/RAP3

# update (db) configuration
ADD localSettings.php /var/www/html/RAP3/
