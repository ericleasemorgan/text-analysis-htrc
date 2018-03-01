#!/bin/bash

# calculate-size.sh - compute the size of all the .db files in a given directory

# Eric Lease Morgan <emorgan@nd.edu>
# May 18, 2015 - first cut;
# June 2, 2015 - added sanity checking


# configure
SCRIPT=./bin/calculate-size.py

# get input
NAME=$1

# sanity check
if [ -z $NAME ]; then

    echo "Usage: $0 <name>"
    exit 1
    
fi

# process each .db file in the given directory
for FILE in $NAME/index/*.db
do

    # parse out the KEY and echo
    KEY=$( basename $FILE .db )
    printf "$KEY\t"

	# do the work
	cat $FILE | $SCRIPT
	
done
