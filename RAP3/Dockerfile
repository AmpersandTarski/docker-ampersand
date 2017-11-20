FROM ampersand:latest

# build RAP3 application by cloning the models repository
RUN mkdir -p ~/git \
 && cd ~/git \
 && git clone --depth=1 --branch RAP_Production https://github.com/AmpersandTarski/Ampersand-models \
# build RAP3 application
 && ampersand --atlas-without-expressions --meta-tables --add-semantic-metamodel -p/var/www/html/RAP3 ~/git/Ampersand-models/RAP3/RAP3.adl --verbose \
 && mkdir -p /var/www/html/RAP3/log \
 && chown -R www-data:www-data /var/www/html/RAP3 \
# build Hawaii demo, which is being used in the Ampersand-tutorial
 && ampersand -p/var/www/html/Hawaii ~/git/Ampersand-models/Hawaii/Hawaii.adl --verbose \
 && chown -R www-data:www-data /var/www/html/Hawaii
