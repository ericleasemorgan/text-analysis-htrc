#!/bin/bash

# search.cgi - rudimentary query interface to the collection

# Eric Lease Morgan <emorgan@nd.edu>
# May 29, 2015 - first investigations; before going to Chicago and DePaul University
# May 30, 2015 - added the search form


# configure
TEMPLATE='../etc/template-search.txt'

# print the magic lines
echo "Content-type: text/html"
echo

# check for input
if [ -z "$QUERY_STRING" ]

	then
	
		# output the search form
		cat $TEMPLATE
		
	else

		# initalize; get the name of the current "database"
		NAME=$( basename $(pwd) )
		
		# get the input; do error checking here!!!
		QUERY=$( echo "$QUERY_STRING" | sed -n 's/^.*q=\([^&]*\).*$/\1/p' | sed "s/%20/ /g" )
				
		# change directories; sigh
		cd ..
		
		# do the work
		./bin/search.py $QUERY $NAME | ./bin/results2html.py $NAME

fi

# done
exit
