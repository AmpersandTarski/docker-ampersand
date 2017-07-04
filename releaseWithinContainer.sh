# Run this script to overwrite RAP3 with its latest release. 
# Precondition: the database structure has not changed.
# Postcondition: the latest release of RAP3 from repo https://github.com/AmpersandTarski/ampersand-models/RAP3 is in production.
# All student scripts are being preserved.

#  echo "creating a backup of scripts and data from RAP3"
. backup.sh

# reminder for Stef: docker exec -ti dockerampersand_rap3_1 /bin/bash

# echo "creating new instance of RAP3"
# tactic: first make a new instance called RAPgen, then release it by flipping directories.
# The existing instance of RAP3 is preserved in RAPprev until the following release.
rm -rf /var/www/html/RAPprev
cd ~/git/Ampersand-models
git pull
mkdir RAPgen
ampersand --meta-tables --add-semantic-metamodel --verbose -pRAPgen RAP3/RAP3.adl
cp RAP3/include/localSettingsProduction.php RAPgen/localSettings.php
sed -i "s|.*Config::set.*{SQLHOST}.*|Config::set('dbHost', 'mysqlDatabase', 'db');|" RAPgen/localSettings.php
cp -r /var/www/html/RAP3/log RAPgen
cp -r /var/www/html/RAP3/scripts RAPgen
chown -R www-data:www-data RAPgen
mv /var/www/html/RAP3 /var/www/html/RAPprev
mv RAPgen /var/www/html/RAP3
