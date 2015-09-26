#!/usr/bin/env python

# about2html.py - transform an about.db file into an HTML stream

# Eric Lease Morgan <emorgan@nd.edu>
# May 31, 2015 - first investigations; Dad died about fifteen years ago today
# June 2, 2015 - added sanity checking


# configure
ABOUT    = '/about.db'
CATALOG  = '/catalog.db'
SEARCH   = './search.cgi?q='
TEMPLATE = './etc/template-about.txt'
JSON     = './json/'
TEXT     = './text/'

# require
import sys
import re

# sanity check
if len( sys.argv ) != 2 :
	print "Usage: " + sys.argv[ 0 ] + ' <name>'
	quit()


# get input
corpus = sys.argv[ 1 ]

# read the database
metadata = {}
with open ( corpus + ABOUT ) as database :

		# process each record
		for record in database :
		
			# map each field to my metadata
			field = record.rstrip().split( '\t' )
			metadata[ field[ 0 ] ] = field[ 1 ]

# mark-up the frequently used words (not scalable)
frequent_links = ''
for word in metadata[ 'FREQUENTWORDS' ].rstrip( '|' ).split( '|' ) :

	fields = word.split( ' ' )
	item   = fields[ 0 ]
	count  = str( fields[ 1 ] )
	frequent_links  = frequent_links + '<a href="' + SEARCH + item + '">' + item + '</a> (' + count + ')&nbsp; '

# colors
color_links = ''
for color in metadata[ 'FREQUENTCOLORS' ].rstrip( '|' ).split( '|' ) :

	fields = color.split( ' ' )
	item   = fields[ 0 ]
	count  = str( fields[ 1 ] )
	color_links  = color_links + '<a href="' + SEARCH + item + '">' + item + '</a> (' + count + ')&nbsp; '

# names
names_links = ''
for name in metadata[ 'FREQUENTNAMES' ].rstrip( '|' ).split( '|' ) :

	fields = name.split( ' ' )
	item   = fields[ 0 ]
	count  = str( fields[ 1 ] )
	names_links  = names_links + '<a href="' + SEARCH + item + '">' + item + '</a> (' + count + ')&nbsp; '

# ideas
ideas_links = ''
for idea in metadata[ 'FREQUENTIDEAS' ].rstrip( '|' ).split( '|' ) :

	fields = idea.split( ' ' )
	item   = fields[ 0 ]
	count  = str( fields[ 1 ] )
	ideas_links  = ideas_links + '<a href="' + SEARCH + item + '">' + item + '</a> (' + count + ')&nbsp; '

# look up keys in catalog and get metadata
catalog = {}
with open ( corpus + CATALOG ) as database :

	index = 0
	for record in database :
	
		# increment and check; we don't need the catalog's header
		index = index + 1
		if index == 1 : continue
		
		# remember, the fields in the (default) catalog
		#   0 - id
		#   1 - title
		#   2 - publication date
		#   3 - size in pages
		#   4 - HathiTrust URL
		#   5 - language
		#   6 - MARC URL
		#   7 - WorldCat URL
		#   8 - size in words
		#   9 - colors coefficient
		#  10 - names coefficient
		#  11 - ideas coefficient
		
		# read a record
		fields = record.rstrip().split( '\t' )

		# get the key
		key = fields[ 0 ]
				
		catalog[ key ] = {}
		catalog[ key ][ 'title' ]      = fields[  1 ]
		catalog[ key ][ 'hathitrust' ] = fields[  4 ]
		catalog[ key ][ 'marc' ]       = fields[  6 ]
		catalog[ key ][ 'worldcat' ]   = fields[  7 ]

# create the links of interest; shortest
item = re.sub( ':', '+', metadata[ 'WORKSHORTEST' ] )
item = re.sub( '/', '=', item)
hathitrust = '<a href="' + catalog[ metadata[ 'WORKSHORTEST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat   = '<a href="' + catalog[ metadata[ 'WORKSHORTEST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext  = '<a href="' + TEXT + item + '.txt">plain text</a>'
workshortest = catalog[ metadata[ 'WORKSHORTEST' ] ][ 'title' ] + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# longest
item         = re.sub( ':', '+', metadata[ 'WORKLONGEST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'WORKLONGEST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'WORKLONGEST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'WORKLONGEST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
worklongest  = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# oldest
item         = re.sub( ':', '+', metadata[ 'WORKOLDEST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'WORKOLDEST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'WORKOLDEST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'WORKOLDEST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
workoldest   = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# newest
item         = re.sub( ':', '+', metadata[ 'WORKNEWEST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'WORKNEWEST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'WORKNEWEST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'WORKNEWEST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
worknewest   = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# most ideas
item         = re.sub( ':', '+', metadata[ 'IDEASMOST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'IDEASMOST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'IDEASMOST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'IDEASMOST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
ideasmost    = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# least ideas
item         = re.sub( ':', '+', metadata[ 'IDEASLEAST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'IDEASLEAST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'IDEASLEAST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'IDEASLEAST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
ideasleast   = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# most names
item         = re.sub( ':', '+', metadata[ 'NAMESMOST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'NAMESMOST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'NAMESMOST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'NAMESMOST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
namesmost    = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# least names
item         = re.sub( ':', '+', metadata[ 'NAMESLEAST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'NAMESLEAST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'NAMESLEAST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'NAMESLEAST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
namesleast   = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# most colors
item         = re.sub( ':', '+', metadata[ 'COLORSMOST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'COLORSMOST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'COLORSMOST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'COLORSMOST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
colorsmost   = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# least colors
item         = re.sub( ':', '+', metadata[ 'COLORSLEAST' ] )
item         = re.sub( '/', '=', item)
title        = catalog[ metadata[ 'COLORSLEAST' ] ][ 'title' ]
hathitrust   = '<a href="' + catalog[ metadata[ 'COLORSLEAST' ] ][ 'hathitrust' ] + '">HathiTrust</a>'
worldcat     = '<a href="' + catalog[ metadata[ 'COLORSLEAST' ] ][ 'worldcat' ]   + '">WorldCat</a>'
plaintext    = '<a href="' + TEXT + item + '.txt">plain text</a>'
colorsleast  = title + ' (' + hathitrust + ' : ' + worldcat + ' : ' + plaintext + ')'

# do some math; add more "kewl" calculations here
pagesaverage = str( int( metadata[ 'PAGESTOTAL' ] ) / int( metadata[ 'CORPUSSIZE' ] ) )
wordsaverage = str( int( metadata[ 'WORDSTOTAL' ] ) / int( metadata[ 'CORPUSSIZE' ] ) )

# slurp up the template; find & replace the tokesn
with open ( TEMPLATE ) as HTML : html = HTML.read()
html = re.sub( '##CORPUSNAME##',     metadata[ 'CORPUSNAME' ],    html )
html = re.sub( '##CORPUSSIZE##',     metadata[ 'CORPUSSIZE' ],    html )
html = re.sub( '##DATEEARLIEST##',   metadata[ 'DATEEARLIEST' ],  html )
html = re.sub( '##DATELATEST##',     metadata[ 'DATELATEST' ],    html )
html = re.sub( '##PAGESSHORTEST##',  metadata[ 'PAGESSHORTEST' ], html )
html = re.sub( '##PAGESLONGEST##',   metadata[ 'PAGESLONGEST' ],  html )
html = re.sub( '##PAGESTOTAL##',     metadata[ 'PAGESTOTAL' ],    html )
html = re.sub( '##PAGESAVERAGE##',   pagesaverage,                html )
html = re.sub( '##WORDSSHORTEST##',  metadata[ 'WORDSSHORTEST' ], html )
html = re.sub( '##WORDSLONGEST##',   metadata[ 'WORDSLONGEST' ],  html )
html = re.sub( '##WORDSTOTAL##',     metadata[ 'WORDSTOTAL' ],    html )
html = re.sub( '##WORDSAVERAGE##',   wordsaverage,                html )
html = re.sub( '##WORDSUNIQUE##',    metadata[ 'WORDSUNIQUE' ],   html )
html = re.sub( '##FREQUENTWORDS##',  frequent_links,              html )
html = re.sub( '##FREQUENTIDEAS##',  ideas_links,                 html )
html = re.sub( '##FREQUENTNAMES##',  names_links,                 html )
html = re.sub( '##FREQUENTCOLORS##', color_links,                 html )
html = re.sub( '##WORKSHORTEST##',   workshortest,                html )
html = re.sub( '##WORKLONGEST##',    worklongest,                 html )
html = re.sub( '##WORKOLDEST##',     workoldest,                  html )
html = re.sub( '##WORKNEWEST##',     worknewest,                  html )
html = re.sub( '##IDEASMOST##',      ideasmost,                   html )
html = re.sub( '##IDEASLEAST##',     ideasleast,                  html )
html = re.sub( '##NAMESMOST##',      namesmost,                   html )
html = re.sub( '##NAMESLEAST##',     namesleast,                  html )
html = re.sub( '##COLORSMOST##',     colorsmost,                  html )
html = re.sub( '##COLORSLEAST##',    colorsleast,                 html )

# output and done
print html
quit()


