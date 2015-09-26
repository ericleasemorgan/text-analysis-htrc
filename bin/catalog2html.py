#!/usr/bin/env python

# catalog2html.py - given the name of a corpus, output a human-readable version of the corpus's catalog

# Eric Lease Morgan <emorgan@nd.edu>
# May 24, 2015 - first cut
# May 25, 2015 - tweaking before going to Detroit to pick up GMCC
# June 1, 2015 - moved HTML off to a template
# June 2, 2015 - added sanity checking


# configure
CATALOG  = '/catalog.db'
HASH     = '''{ "id": "##ID##", "shortTitle": "##SHORTTITLE##", "title": "##TITLE##", "date": "##DATE##", "pages": "##PAGES##", "hathitrust": "##HATHITRUST##", "language": "##LANGUAGE##", "marc": "##MARC##", "worldcat": "##WORLDCAT##", "words": "##WORDS##", "color": "##COLOR##", "names": "##NAMES##", "ideas": "##IDEAS##" }, '''
TEMPLATE = './etc/template-catalog.txt'

# require
import sys
import re

# sanity check
if len( sys.argv ) != 2 :
	print "Usage:", sys.argv[ 0 ], '<name>'
	quit()

# get input
name = sys.argv[ 1 ]

# open the database
data  = ''
with open( name + CATALOG ) as database :

	# initialize
	index = 0

	# process each record
	for record in database :

		# increment and re-initialize
		index += 1
		hash  =  HASH
		
		# read a record, and split it into fields
		fields = record.rstrip().split( '\t' )
		
		# check for header
		if index == 1 : continue
		
		# process the data
		else :
		
			# do the substitutions
			hash = re.sub( '##ID##',         fields[ 0 ],  hash )
			
			title = re.sub( '\"', '\\"', fields[ 1 ] )
			hash = re.sub( '##SHORTTITLE##', title[:50] + '...',  hash )
			hash = re.sub( '##TITLE##',      title,  hash )
			
			hash = re.sub( '##DATE##',       fields[ 2 ],  hash )
			hash = re.sub( '##PAGES##',      fields[ 3 ],  hash )
			hash = re.sub( '##HATHITRUST##', fields[ 4 ],  hash )
			hash = re.sub( '##LANGUAGE##',   fields[ 5 ],  hash )
			hash = re.sub( '##MARC##',       fields[ 6 ],  hash )
			hash = re.sub( '##WORLDCAT##',   fields[ 7 ],  hash )
			hash = re.sub( '##WORDS##',      fields[ 8 ],  hash )
			hash = re.sub( '##COLOR##',      fields[ 9 ],  hash )
			hash = re.sub( '##NAMES##',      fields[ 10 ], hash )
			hash = re.sub( '##IDEAS##',      fields[ 11 ], hash )
			
		# update the data
		data += hash
		
# create the html; do the substitutions
with open ( TEMPLATE ) as HTML : html = HTML.read()
html = re.sub( '##TITLE##', name, html )
html = re.sub( '##DATA##',  data, html )

# output and done
print html
quit()


