#!/usr/bin/env python

# build-corpus.cgi - a CGI front-end to build-corpus.sh

# Eric Lease Morgan <emorgan@nd.edu>
# January 7, 2016 - first investigations; based on make-everything.cgi from EEBO


# configure
ROOT   = '/var/www/html/hathitrust'
LOG    = 'tmp/log.txt'
RSYNC  = 'tmp/rsync.sh'
URL    = 'https://kilgour.library.nd.edu/hathitrust/'
LENGTH = 8

# require
import cgi
import cgitb
import os
import random
import string

# initialize
cgitb.enable()
os.chdir( ROOT )

# read and parse the input of identifiers
input = cgi.FieldStorage()
rsync = input['rsync'].value

# create a unique title (key) for this collection; see http://stackoverflow.com/questions/2257441/random-string-generation-with-upper-case-letters-and-digits-in-python
title = os.environ[ 'REMOTE_USER' ] + '-' + ''.join( random.SystemRandom().choice( string.ascii_lowercase + string.digits ) for _ in range( LENGTH ) )

# save the identifiers to a file
file = open( RSYNC, 'w' )
file.write( rsync )
file.close()

# start the output
print "Content-Type: text/plain"
print 
print title

# build the shell command and echo it
command = "/bin/bash ./bin/build-corpus.sh " + title + ' ' + RSYNC + " &>" + LOG 
print command

# do the work; Danger! Danger! Danger Will Robinson! Intruder alert! Danger! Danger!
os.system( command )

# echo contents of the log file
with open( LOG, 'r' ) as input: print input.read()

# echo the location of the newly created collection
print URL + title

# done
exit
