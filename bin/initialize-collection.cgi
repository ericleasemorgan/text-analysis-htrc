#!/usr/bin/env python

# initialize-collection.cgi - a CGI front-end to build-corpus.sh

# Eric Lease Morgan <emorgan@nd.edu>
# January 7, 2016 - first investigations; based on same script from EEBO


# configure
TEMPLATE = '/var/www/html/hathitrust/etc/template-initialize-collection.txt'

# slurp up the template; sort of dumb but keeps all templates in one place
template = open( TEMPLATE, 'r' )
html     = template.read()

# done
print "Content-Type: text/html"
print 
print html
exit

