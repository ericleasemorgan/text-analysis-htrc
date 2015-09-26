#!/usr/bin/env python

# search.py - given a word and an index, return a list of relevancy ranked identifiers whose document contains the word

# Eric Lease Morgan <emorgan@nd.edu>
# May 21, 2015 - first cut
# May 27, 2015 - merged search results with "catalog"; added local json and text links


# configure
DEBUG   = 0
CATALOG = '/catalog.db'
JSON    = '/json/'
TEXT    = '/text/'

# require
import glob
import math
import ntpath
import re
import sys
import operator

# sanity check
if len( sys.argv ) != 3 :
	print "Usage" + sys.argv[ 0 ] + ' <query> <name>'
	quit()

# get input; sanity check
query     = sys.argv[ 1 ].lower()
directory = sys.argv[ 2 ]

# initialize
total_documents = 0;
hits            = {};

# process each (database) file in the given directory
for filename in glob.glob( directory + '/index/*.db' ) :
	
	# increment
	total_documents += 1

	# re-initialize
	found      = 0
	size       = 0
	statistics = {}
	statistics = { 'count' : 0, 'size' : size, 'tfidf' : 0 }
	
	# process each "database"
	with open( filename ) as DATABASE :
	
		# create a key for the dictionary of hits
		key = ntpath.basename( filename )
		key = re.sub( '\.db$', '', key )

		# process each record
		for record in DATABASE :
			
			# parse
			fields = record.rstrip().split( '\t' )
			word   = fields[ 0 ]
			count  = int( fields[ 1 ] )

			# check for hit
			if word == query :
		
				# update statistics and hits
				statistics[ 'count' ] = count
				hits[ key ]           = statistics
					
				# update found
				found = 1;
			
			# increment size of document
			size += count
	
		# update statistics
		if found : hits[ key ][ 'size' ] = size 
	
		# debug
		if DEBUG :
			sys.stdout.write( 'documents: ' + str( total_documents ) + '\thits: ' + str( len( hits ) ) + '\r' )
			sys.stdout.flush()

# debug
if DEBUG : print( 'documents: ' + str( total_documents ) + '\thits: ' + str( len( hits ) ) )

# score all the hits
d = total_documents
h = len( hits )
for key in sorted( hits ) :

	# re-initialize
	n     = hits[ key ][ 'count' ]
	t     = hits[ key ][ 'size' ]
	tfidf = 0
	
	# calculate tfidf = ( n / t ) * log( d / h ) where:
	#     n = number of times a word appears in a document
	#     t = total number of words
	#     d = total number of documents
	#     h = number of documents that contain the word	
	if d == h : tfidf = float( n ) / t
	else : tfidf = ( float( n ) / t ) * math.log( float( d ) / h )
	
	# debug
	if DEBUG :

		# echo
		print 'filename: ' + key
		print '   count: ' + str( n )
		print '    size: ' + str( t )
		print '   tfidf: ' + str( tfidf )
		print ''

	# update
	hits[ key ][ 'tfidf' ] = tfidf

# update the list of keys in the hits with its metadata
with open( directory + CATALOG ) as DATABASE :

		# initialize the pointer
		pointer = 0
		
		# process each record in the catalog
		for record in DATABASE :

			# increment; we don't want the field headers
			pointer = pointer + 1
			if pointer == 1 : continue
			
			# read the record
			fields = record.rstrip().split( '\t' )
			
			# get the key and munge it 
			key = re.sub( ':', '+', fields[ 0 ])
			key = re.sub( '/', '=', key)
					
			# search for the key in the list hits - "needle in a haystack"
			if key in hits :
				
				# update the hit list
				hits[ key ][ 'title' ]      = fields[  1 ]
				hits[ key ][ 'date' ]       = fields[  2 ]
				hits[ key ][ 'pages' ]      = fields[  3 ]
				hits[ key ][ 'hathitrust' ] = fields[  4 ]
				hits[ key ][ 'language' ]   = fields[  5 ]
				hits[ key ][ 'marc' ]       = fields[  6 ]
				hits[ key ][ 'worldcat' ]   = fields[  7 ]
				hits[ key ][ 'color' ]      = fields[  9 ]
				hits[ key ][ 'names' ]      = fields[ 10 ]
				hits[ key ][ 'ideas' ]      = fields[ 11 ]

# output; I wish I could sort by tfidf!
for key in sorted( hits ) :
	
	# parse
	count      = hits[ key ][ 'count' ]
	size       = hits[ key ][ 'size' ]
	tfidf      = hits[ key ][ 'tfidf' ]
	title      = hits[ key ][ 'title' ]
	date       = hits[ key ][ 'date' ]
	pages      = hits[ key ][ 'pages' ]
	hathitrust = hits[ key ][ 'hathitrust' ]
	language   = hits[ key ][ 'language' ]
	marc       = hits[ key ][ 'marc' ]
	worldcat   = hits[ key ][ 'worldcat' ]
	color      = hits[ key ][ 'color' ]
	names      = hits[ key ][ 'names' ]
	ideas      = hits[ key ][ 'ideas' ]
	
	# get the key and munge it, again 
	key = re.sub( ':', '+', key )
	key = re.sub( '/', '=', key )

	# define the local json and text versions
	text = directory + TEXT + key + '.txt'
	json = directory + JSON + key + '.json'
	
	# echo: key count size tfidf title date pages hathitrust language marc worldcat color names ideas text json
	print key + '\t' + str( count) + '\t' + str( size ) + '\t' + str( tfidf ) + '\t' + title + '\t' + date + '\t' + pages + '\t' + hathitrust + '\t' + language + '\t' + marc + '\t' + worldcat + '\t' + color + '\t' + names + '\t' + ideas + '\t' + text + '\t' + json

# done
quit()
