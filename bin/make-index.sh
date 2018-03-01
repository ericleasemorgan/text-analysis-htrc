#!/bin/bash

# make-index.sh - create frequency files from the contents of a directory

# Eric Lease Morgan <emorgan@nd.edu>
# May 18, 2015 - first cut; needs error checking
# June 2, 2015 - added some sanity checking; added prettier debugging


# configure
JSON2FREQUENCY=./bin/make-index.py

# get input
NAME=$1
JSON=$2

# parse out the KEY and echo
KEY=$( basename $JSON .json )
echo "indexing $JSON"

# do the work



if [ -f "./collections/$NAME/index/$KEY.db" ]; then

	echo "./collections/$NAME/index/$KEY.db exists" >&2
	
else

	# do the work
	cat $JSON | $JSON2FREQUENCY -d > ./collections/$NAME/index/$KEY.db

fi

if [ -f "./collections/$NAME/text/$KEY.txt" ]; then

	echo "./collections/$NAME/text/$KEY.txt exists" >&2
	
else

	# do the work
	cat $JSON | $JSON2FREQUENCY -b > ./collections/$NAME/text/$KEY.txt

fi

	


