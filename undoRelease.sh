# When you have just taken a new version of RAP3 to production, but you want to revert this, you can use this script.
# Precondition: RAPprev exists and contains the previous state of the RAP3-software.
# Postcondition: The RAP3-software is restored to its previous state.

# reminder for Stef: docker exec -ti dockerampersand_rap3_1 /bin/bash

# echo "restoring RAP3 to its previous state"
# tactic: first make a new instance called RAPgen, then release it by flipping directories.
# The existing instance of RAP3 is preserved in RAPprev until the following release.

cd /var/www/html/
mv RAP3 RAPgen
mv RAPprev RAP3
