FROM ampersand:latest

# build RAP3 application by cloning the models repository
RUN mkdir -p ~/git \
 && cd ~/git \
 && git clone --depth=1 --branch master https://github.com/AmpersandTarski/Ampersand-models \
 && ampersand --meta-tables --add-semantic-metamodel -p/var/www/html/RAP3 ~/git/Ampersand-models/RAP3/RAP3.adl --verbose \
 && mkdir -p /var/www/html/RAP3/log \
 && cp ~/git/Ampersand-models/RAP3/include/localSettingsProduction.php /var/www/html/RAP3/localSettings.php \
 && sed -i "s|.*Config::set.*{SQLHOST}.*|Config::set('dbHost', 'mysqlDatabase', 'db');|" /var/www/html/RAP3/localSettings.php \
 && chown -R www-data:www-data /var/www/html/RAP3

