#!/usr/bin/env python

# list-collections.cgi - determine which collections belong to the current reader

# Eric Lease Morgan <emorgan@nd.edu>
# January 8, 2016 - first cut; based on list-collections.cgi from EEBO; on the train to Boston


# configure
DB       = '/var/www/html/hathitrust/etc/collections.db'
URL      = 'http://kilgour.library.nd.edu/hathitrust/'
TEMPLATE = '/var/www/html/hathitrust/etc/template-list-collections.txt'

# require
import os

# generate a list of collections created by the current reader (user)
collections = ''
reader      = os.environ[ 'REMOTE_USER' ]
for record in open( DB, 'rb' ) :
	collection, date, time = record.split( '\t' )
	creator, key           = collection.split( '-' )
	if creator == reader :
		url         = URL + collection
		collections = collections + '<li><a href="' + url + '">' + collection + '</a></li>'
		
# slurp up the template and do the necessary replacement(s)
template = open( TEMPLATE, 'r' )
html     = template.read()
html     = html.replace( '##COLLECTIONS##',  collections )

# done
print "Content-Type: text/html"
print 
print html
exit




