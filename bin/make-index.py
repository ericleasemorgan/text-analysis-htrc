#!/usr/bin/env python

# make-index.py - read HathiTrust Research Center JSON files and output word frequencies as well as a "book"

# Eric Lease Morgan <emorgan@nd.edu>
# May 18, 2015 - first cut; see https://sharc.hathitrust.org/features
# May 20, 2015 - tweaked regular expressions
# May 22, 2015 - tweaked regular expressions (again), and added plain text book output
# May 28, 2015 - added local stop word support; removed the need for NLTK
# June 2, 2015 - added sanity checking


# configure
STOPWORDS = './etc/stopwords-en.txt'

# require
import operator
import re
import sys
import json

# sanity check
if ( len( sys.argv ) != 2 ) | ( sys.stdin.isatty() ) :
	print "Usage: cat <json> |", sys.argv[ 0 ], '<-b|-d>'
	quit()

# get input; sanity check
flag = sys.argv[ 1 ]

# build a book?
if   flag == '-b' : build_book = 1
elif flag == '-d' : build_book = 0
else :
	print "Usage: cat <json> |", sys.argv[ 0 ], '<-b|-d>'
	quit()

# initialize 
json      = json.load( sys.stdin )
words     = {}
book      = ( json[ 'metadata' ][ 'title' ] ).encode( 'utf-8' ) + '\t' + ( json[ 'metadata' ][ 'handleUrl' ] ).encode( 'utf-8' ) + '\n'

# create a list of (English) stopwords
stopwords = {}
with open ( STOPWORDS ) as DATABASE :
	for record in DATABASE : stopwords[ record.rstrip() ] = 1

# process each page
pages = json['features' ][ 'pages' ]
for page in pages :
	
	# process each token (word) on the page
	tokens = page[ 'body' ][ 'tokenPosCount' ]
	for token in tokens.keys() :
		
		# filter out unwanted tokens (words)
		word = token.lower()
		if len( word ) < 2           : continue
		if re.match( '\d|\W', word ) : continue
		if word in stopwords         : continue
		
		# build text file
		if build_book : book = book + word.encode( 'utf-8' ) + ' ' 
			
		# or build dictionary
		else :
		
			# process the remaining POS elements; update the dictionary
			poses = tokens[ token ]
			for pos in poses : words[ word ] = words.get( word, 0 ) + poses[ pos ]
	
	# delimit a page in the book
	if build_book : book = book + '\n\n'
	
# output book, or
if build_book : print re.sub( '\n\n+', '\n\n', book )

# output the dictionary
else :
	for tuple in sorted( words.items(), key=operator.itemgetter( 1 ), reverse=True ) :
		print( tuple[ 0 ].encode( 'utf-8' ) + '\t' + str( tuple[ 1 ] ) )

# done
quit()


