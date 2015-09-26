#!/usr/bin/env python

# calculate-size.py - count the number of occurrences in a document

# Eric Lease Morgan <emorgan@nd.edu>
# May 19, 2015 -  first cut
# June 2, 2015 - added sanity checking


# require
import sys

# initialize
total = 0

# sanity check
if ( len( sys.argv ) != 1 ) | ( sys.stdin.isatty() ) :
	print "Usage: cat <db> |", sys.argv[ 0 ]
	quit()

# process each line from standard input
for record in sys.stdin:
	fields = record.rstrip().split( '\t' )
	total += int( fields[ 1 ] )

# output and done
print( total )
quit()

