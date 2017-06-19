. common.sh

# restore db backup
echo "restore backup of ampersand databases"
docker cp ./${backup_file_db} ${dbcontainer}:/tmp/${backup_file_db} 
docker-compose exec ${dbservice} sh -c "mysql --user=${db_user} --password=${db_password} < /tmp/${backup_file_db}"
docker-compose exec ${dbservice} sh -c "rm /tmp/${backup_file_db}"

# restore scripts backup
echo "restoring backup of scripts"
docker cp ./${backup_file_scripts} ${rap3container}:/tmp/${backup_file_scripts}
docker-compose exec ${rap3service} sh -c "cd /var/www/html/RAP3 && rm -rf scripts && tar xvzf /tmp/${backup_file_scripts} scripts"
docker cp ${rap3container}:/tmp/${backup_file_scripts} ./${backup_file_scripts}
docker-compose exec ${rap3service}  sh -c "rm /tmp/${backup_file_scripts}"

