#!/bin/bash

# update-db.sh - append new item to the list of collections

# Eric Lease Morgan <emorgan@nd.edu>
# January 8, 2016 - first cut; on the train to Boston


# configure
DB=/var/www/html/hathitrust/etc/collections.db

# get input
NAME=$1

# sanity check; needs additional error checking
if [ -z $NAME ]; then

    echo "Usage: $0 <name>"
    exit 1
    
fi

# do the work ( name, date, time)
echo -e $NAME '\t' $( date +"%F" ) '\t' $( date +"%R" ) >> $DB

# done
exit

