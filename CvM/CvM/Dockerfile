FROM ampersand:latest

# build CvM application by cloning the models repository

RUN mkdir -p ~/git \
 && cd ~/git \
 && git clone --depth=1 --branch master https://github.com/AmpersandTarski/Ampersand-models \
 && ampersand -p/var/www/html/CvM ~/git/Ampersand-models/Contract\ Management/CvM.adl --verbose \
 && mkdir -p /var/www/html/RAP3/log \
 && sed -i "s|.*Config::set.*localhost.*|Config::set('dbHost', 'mysqlDatabase', 'db');|" /var/www/html/RAP3/localSettings.php \
 && chown -R www-data:www-data /var/www/html/RAP3 \
 && rm -rf ~/git
