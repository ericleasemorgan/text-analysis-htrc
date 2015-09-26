#!/usr/bin/env python

# results2html.py - given standard input, output an HTML table of search results

# Eric Lease Morgan <emorgan@nd.edu>
# May 28, 2015 - first investigations
# May 30, 2015 - tweaked display, but how do I turn (toggle) off specific columns by default
# June 1, 2015 - moved the html template off to a file
# June 2, 2015 - added (some) sanity checking


# configure
HASH     = '''{ "id": "##ID##", "shortTitle": "##SHORTTITLE##", "title": "##TITLE##", "date": "##DATE##", "pages": "##PAGES##", "hathitrust": "##HATHITRUST##", "language": "##LANGUAGE##", "marc": "##MARC##", "worldcat": "##WORLDCAT##", "words": "##WORDS##", "color": "##COLOR##", "names": "##NAMES##", "ideas": "##IDEAS##", "count": "##COUNT##", "tfidf": "##TFIDF##", "text": "##TEXT##", "json": "##JSON##" }, '''
TEMPLATE = './etc/template-search-results.txt'

# require
import sys
import re

# sanity check
if ( len( sys.argv ) != 2 ) | ( sys.stdin.isatty() ) :
	print "Usage: ./bin/search.py <query> <name> | " + sys.argv[ 0 ] + ' <name>'
	quit()

# get input
name = sys.argv[ 1 ]

# initialize
data = ''

# process each record
for hit in sys.stdin:

	# re-initialize
	hash = HASH
	
	# read a record, and split it into fields
	fields = hit.rstrip().split( '\t' )
		
	# do the substitutions
	hash = re.sub( '##ID##',         fields[  0 ],  hash )
	
	title = re.sub( '\"', '\\"',     fields[  4 ] )
	hash = re.sub( '##SHORTTITLE##', title[:50] + '...',  hash )
	hash = re.sub( '##TITLE##',      title,  hash )
	
	hash = re.sub( '##DATE##',       fields[  5 ],  hash )
	hash = re.sub( '##PAGES##',      fields[  6 ],  hash )
	hash = re.sub( '##HATHITRUST##', fields[  7 ],  hash )
	hash = re.sub( '##LANGUAGE##',   fields[  8 ],  hash )
	hash = re.sub( '##MARC##',       fields[  9 ],  hash )
	hash = re.sub( '##WORLDCAT##',   fields[ 10 ],  hash )
	hash = re.sub( '##WORDS##',      fields[  2 ],  hash )
	hash = re.sub( '##COLOR##',      fields[ 11 ],  hash )
	hash = re.sub( '##NAMES##',      fields[ 12 ], hash )
	hash = re.sub( '##IDEAS##',      fields[ 13 ], hash )
	hash = re.sub( '##COUNT##',      fields[  1 ], hash )
	hash = re.sub( '##TFIDF##',      fields[  3 ], hash )
	hash = re.sub( '##TEXT##',       fields[ 14 ], hash )
	hash = re.sub( '##JSON##',       fields[ 15 ], hash )
		
	# update the data
	data += hash

# create the html; do the substitutions
with open ( TEMPLATE ) as HTML : html = HTML.read()
html = re.sub( '##TITLE##', name, html )
html = re.sub( '##DATA##',  data, html )

# output and done
print html
quit()


