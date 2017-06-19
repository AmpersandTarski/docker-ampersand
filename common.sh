rap3service=rap3
dbservice=db

rap3container=$(docker-compose ps -q ${rap3service})
dbcontainer=$(docker-compose ps -q ${dbservice})

backup_file_scripts="backup-scripts.tar.gz"
backup_file_db="backup-db.gz"

db_user=ampersand
db_password=ampersand
