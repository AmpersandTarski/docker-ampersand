# Run this script to overwrite RAP3 with its latest release. 
# Precondition: the database structure has not changed.
# Postcondition: the latest release of RAP3 from repo https://github.com/AmpersandTarski/ampersand-models/RAP3 is in production.
# All student scripts are being preserved.

. common.sh

docker cp ./releaseWithinContainer.sh ${rap3container}:/tmp/releaseWithinContainer.sh
docker-compose exec ${rap3service} sh -c "/tmp/releaseWithinContainer.sh"
docker-compose exec ${rap3service} sh -c "rm /tmp/releaseWithinContainer.sh"
