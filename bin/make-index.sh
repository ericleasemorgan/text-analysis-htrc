#!/bin/bash

# make-index.sh - create frequency files from the contents of a directory

# Eric Lease Morgan <emorgan@nd.edu>
# May 18, 2015 - first cut; needs error checking
# June 2, 2015 - added some sanity checking; added prettier debugging


# configure
JSON2FREQUENCY=./bin/make-index.py

# get input
NAME=$1

# sanity check
if [ -z $NAME ]; then

    echo "Usage: $0 <name>"
    exit 1
    
fi

# process each json file in the given directory
for FILE in $NAME/json/*.json
do
    
    # parse out the KEY and echo
    KEY=$( basename $FILE .json )
    echo "indexing $FILE"
	
	# do the work
	cat $FILE | $JSON2FREQUENCY -d > $NAME/index/$KEY.db
	cat $FILE | $JSON2FREQUENCY -b > $NAME/text/$KEY.txt
	
done
