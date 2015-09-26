#!/usr/bin/env python

# make-catalog.py - create a "catalog" from a set of HathiTrust json files

# Eric Lease Morgan <emorgan@nd.edu>
# May 18, 2015 - first cut; see https://sharc.hathitrust.org/features
# May 23, 2015 - removed the header because it is done in the upper-level shell script
# June 2, 2015 - added JSON configuration


# configure
WORLDCAT = 'http://worldcat.org/oclc/'
JSON     = '/json/'

# require
import glob
import json
import sys
import os


# sanity check
if len( sys.argv ) != 2 :
	print "Usage:", sys.argv[ 0 ], '<name>'
	quit()

# get input
name = sys.argv[ 1 ]

# process each json file in the given directory
for filename in glob.glob( name + JSON + '*.json' ):

	# open and read the file
	with open( filename ) as data: metadata = json.load( data )
		
	# parse
	id           = metadata[ 'id' ]
	title        = ( metadata[ 'metadata' ]['title' ] ).encode( 'utf-8' )
	date_created = metadata[ 'metadata' ][ 'pubDate' ]
	page_count   = metadata[ 'features' ][ 'pageCount' ]
	handle       = metadata[ 'metadata' ][ 'handleUrl' ]
	language     = metadata[ 'metadata' ][ 'language' ]
	marc         = metadata[ 'metadata' ][ 'htBibUrl' ]
	worldcat     = WORLDCAT + metadata[ 'metadata' ][ 'oclc' ]

	# output a list of the metadata
	print( '\t'.join( map( str, [ id, title, date_created, page_count, handle, language, marc, worldcat ] ) ) )
	
# done
quit()

