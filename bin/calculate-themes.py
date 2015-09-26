#!/usr/bin/env python

# themes.py - given a lexicon, compute a quotient denoting the significance of the lexicon's use

# Eric Lease Morgan <emorgan@nd.edu>
# May 21, 2015; first cut
# May 30, 2015; removed division by zero error, probably


# require
import sys
import operator

# sanity check
if len( sys.argv ) != 4 :
	print "Usage:", sys.argv[ 0 ], '<-i|-v> <file> <lexicon>'
	quit()

# get input; sanity check
flag    = sys.argv[ 1 ]
file    = sys.argv[ 2 ]
lexicon = sys.argv[ 3 ]

# set verbose
if   flag == '-i' : verbose = 0
elif flag == '-v' : verbose = 1 
else :
	print "Usage:", sys.argv[ 0 ], '<-i|-v> <file> <lexicon>'
	quit()

# read the lexicon
dictionary = {}
with open( lexicon ) as INPUT :
	for line in INPUT : dictionary[ line.rstrip() ] = 1

# initialize
total_words   = 0
total_lexicon = 0

# open the "database"
with open( file ) as DATABASE :
	
	# process each record in the file
	for record in DATABASE :
		
		# parse
		fields = record.rstrip().split( '\t' )
		word   = fields[ 0 ]
		count  = int( fields[ 1 ] )
		
		# increment
		total_words += count

		# check for dictionary word and increment accordingly
		if dictionary.get( word, 0 ) :
			dictionary[ word ] += count
			total_lexicon      += count

# compute and output
if verbose :
	for tuple in sorted( dictionary.items(), key=operator.itemgetter( 1 ), reverse=True ) :
		print( tuple[ 0 ] + '\t' + str( tuple[ 1 ] ) )
		
else :

	# division by zero is a bad thing
	if total_words == 0 : print '0'
	
	else :
	
		# calculate simple quotient
		print( float( total_lexicon ) / float( total_words ) ) * 100
	
# done
quit()

