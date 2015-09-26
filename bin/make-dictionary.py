#!/usr/bin/env python

# dictionary.py - create a frequency file containing all the words in a corpus -- a dictionary

# Eric Lease Morgan <emorgan@nd.edu>
# May 19, 2015; first cut

# require
import sys
import operator
import glob

# sanity check
if len( sys.argv ) != 2 :
	print "Usage:", sys.argv[ 0 ], '<name>'
	quit()

# initialize
directory = sys.argv[ 1 ]
words     = {}

# process each db file in the given directory
for filename in glob.glob( directory + '*.db' ) :

	# open a file
	with open( filename ) as file :
	
		# process each line (record)
		for record in file :
			
			# parse out the fields and update the dictionary
			fields = record.rstrip().split( '\t' )
			words[ fields[ 0 ] ] = words.get( fields[ 0 ], 0 ) + int( fields[ 1 ] )
	
# reverse sort and output
for tuple in sorted( words.items(), key=operator.itemgetter( 1 ), reverse=True ) :
	print( tuple[ 0 ] + '\t' + str( tuple[ 1 ] ) )

# done
quit()

