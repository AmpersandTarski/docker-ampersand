. common.sh

# create scripts backup
echo "creating backup of scripts"
docker-compose exec ${rap3service} sh -c "cd /var/www/html/RAP3 && tar cvzf /tmp/${backup_file_scripts} scripts"
docker cp ${rap3container}:/tmp/${backup_file_scripts} ./${backup_file_scripts}
docker-compose exec ${rap3service}  sh -c "rm /tmp/${backup_file_scripts}"

# create db backup
echo "creating backup of ampersand databases"
docker-compose exec ${dbservice} sh -c "mysqldump --user=${db_user} --password=${db_password} --all-databases > /tmp/${backup_file_db}"
docker cp ${dbcontainer}:/tmp/${backup_file_db} ./${backup_file_db}
docker-compose exec ${dbservice} sh -c "rm /tmp/${backup_file_db}"
