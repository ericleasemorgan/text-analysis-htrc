#!/usr/bin/env python

# heat.py - given a directory and a list of "topics", heat map how the topics are dispersed in a corpus
# See --> https://de.dariah.eu/tatom/topic_model_mallet.html

# Eric Lease Morgan <emorgan@nd.edu>
# October 17, 2017 - first cut; I can't say I understand this


# configure
WIDTH     = 0.5
EXTENSION = '.txt'

# require
import itertools
import matplotlib.pyplot as plt
import numpy as np
import operator
import os
import sys

# define
def grouper( n, iterable, fillvalue=None ):
	args = [ iter( iterable ) ] * n
	return itertools.zip_longest( *args, fillvalue=fillvalue )

# sanity check
if len( sys.argv ) != 3 :
	sys.stderr.write( 'Usage: ' + sys.argv[ 0 ] + " <corpus> <topics>\n" )
	quit()

# get input
corpus   = sys.argv[ 1 ]
database = sys.argv[ 2 ]

# initialize
filenames = sorted( [ os.path.join( corpus, filename ) for filename in os.listdir( corpus ) ] )
triples   = []
documents = []

# parse the database of previously created topics
with open( database ) as f :
	f.readline()
	for line in f :
		values   = line.rstrip().split( '\t' )	
		index    = values.pop( 0 )
		document = values.pop( 0 )	
		documents.append( document )
		for topic, share in grouper( 2, values ) : triples.append( ( document, topic, float( share ) ) )

triples    = sorted( triples, key=operator.itemgetter( 0, 1 ) )
documents  = sorted( documents )
num_topics = len( triples) // len( documents )
topics     = np.zeros( ( len( documents ), num_topics ) )

for i, ( doc_name, triples ) in enumerate( itertools.groupby( triples, key=operator.itemgetter( 0 ) ) ) :
	topics[ i, : ] = np.array( [ share for _, _, share in triples ] )

# build the visualization
N, K   = topics.shape
keys   = [ os.path.basename( filename ).replace( EXTENSION, '' ) for filename in filenames ] 
labels = [ 'Topic #{}'.format( k ) for k in range( K ) ]
plt.ylim( ( 0, 1 ) )
plt.pcolor( topics, norm=None, cmap='Blues' )
plt.yticks( np.arange( topics.shape[ 0 ] ) + 0.5, keys )
plt.xticks( np.arange( topics.shape[ 1 ] ) + 0.5, labels )
plt.gca().invert_yaxis()
plt.xticks( rotation=90 )
plt.colorbar( cmap='Blues' )
plt.tight_layout()

# output and done
plt.show()
exit()



