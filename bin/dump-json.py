#!/usr/bin/env python

# dumpjson.py - pretty print a JSON file to STDOUT

# Eric Lease Morgan <emorgan@nd.edu>
# May 18, 2015 - first cut; see https://sharc.hathitrust.org/features
# June 2, 2015 - added sanity check


# require
import json
import sys
from pprint import pprint

# sanity check
if sys.stdin.isatty() :
	print "Usage: cat <json> |", sys.argv[ 0 ]
	quit()

# import from STDIN
pprint( json.load( sys.stdin ) )
