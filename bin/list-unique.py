#!/usr/bin/env python

# list-unique.py - list all the unique words in a document

# Eric Lease Morgan <emorgan@nd.edu>
# May 19, 2015 - first cut
# June 2, 2015 - added sanity checking


# require
import sys

# sanity check
if sys.stdin.isatty() :
	print "Usage: cat <name>/dictionary.db |", sys.argv[ 0 ]
	quit()

# initialize
unique = []

# process each line from standard input
for record in sys.stdin:
	fields = record.rstrip().split( '\t' )
	if fields[ 1 ] == str( 1 ) : unique.append( fields[ 0 ] )

# output and done
for word in sorted( unique ) : print( word )
quit()

