# Run this script to overwrite RAP3 with its latest release. 
# Precondition: the database structure has not changed.
# Postcondition: the latest release of RAP3 from repo https://github.com/AmpersandTarski/ampersand-models/RAP3 is in production.
# All student scripts are being preserved.

htdocs=/var/www/html/
gitrepo=/root/git/Ampersand-models

echo "creating new instance of RAP3"
# tactic: first make a new instance called RAPgen, then release it by flipping directories.
# The existing instance of RAP3 is preserved in RAPprev until the following release.
rm -rf ${htdocs}RAPprev
cd ${gitrepo}
git pull
mkdir RAPgen
ampersand --meta-tables --add-semantic-metamodel --verbose -pRAPgen ${gitrepo}/RAP3/RAP3.adl
cp ${gitrepo}/RAP3/include/localSettingsProduction.php RAPgen/localSettings.php
cp -r ${htdocs}RAP3/log RAPgen
cp -r ${htdocs}RAP3/scripts RAPgen
mv RAPgen ${htdocs}
cd ${htdocs}
mv RAP3 RAPprev
mv RAPgen RAP3
chown -R www-data:www-data RAP3
