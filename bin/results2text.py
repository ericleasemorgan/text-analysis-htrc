#!/usr/bin/env python

# results2text.py - format search results as a stream of plain text

# Eric Lease Morgan <emorgan@nd.edu>
# May 27, 2015 - first cut
# June 2, 2015 - added sanity checking


# require
import sys

# sanity check
if sys.stdin.isatty() :
	print "Usage: ./bin/search.py <query> <name> | " + sys.argv[ 0 ] 
	quit()
	
# initialize
pointer = 0

# process each hit from standard input
for hit in sys.stdin:

	# increment
	pointer = pointer + 1
	
	# get a record with the following strucxture:
	#   0 - key
	#   1 - count
	#   2 - size
	#   3 - tfidf
	#   4 - title
	#   5 - date
	#   6 - pages
	#   7 - hathitrust
	#   8 - language
	#   9 - marc
	#  10 - worldcat
	#  11 - color
	#  12 - names
	#  13 - ideas
	#  14 - text
	#  15 - json
	fields = hit.rstrip().split( '\t' )
	
	# output
	print( str( pointer ) + '. '   +      fields[  4 ] )
	print( '              tfidf: ' + str( fields[  3 ] ) )
	print( '              count: ' + str( fields[  1 ] ) )
	print( '               size: ' + str( fields[  2 ] ) )
	print( '               date: ' + str( fields[  5 ] ) )
	print( '              pages: ' + str( fields[  6 ] ) )
	print( '           langauge: ' +      fields[  8 ] )
	print( '  color coefficient: ' + str( fields[ 11 ] ) )
	print( '  names coefficient: ' + str( fields[ 12 ] ) )
	print( '  ideas coefficient: ' + str( fields[ 13 ] ) )
	print( '         HathiTrust: ' +      fields[  7 ] )
	print( '           WorldCat: ' +      fields[ 10 ] )
	print( '               MARC: ' +      fields[  9 ] )
	print( '               text: ' +      fields[ 14 ] )
	print( '               JSON: ' +      fields[ 15 ] )
	print

# done
quit()

