#!/usr/bin/env python

# topic-model.py - given a directory of plain text files, compute t topics with d dimensions exemplified by f files
# see -> https://medium.com/@aneesha/topic-modeling-with-scikit-learn-e80d33668730
# see also -> https://de.dariah.eu/tatom/topic_model_python.html

# Eric Lease Morgan <emorgan@nd.edu>
# September 25, 2017 - first cut; needs to list documents
# September 27, 2017 - started adding documents; "Thanks Jason Thomale!"
# September 28, 2017 - calling it version 1.0, but it can easy get creeping feature-itis


# require
from sklearn.decomposition import NMF
from sklearn.feature_extraction.text import TfidfVectorizer
import os
import sys

# sanity check
if len( sys.argv ) != 5 :
	sys.stderr.write( 'Usage: ' + sys.argv[ 0 ] + " <directory> <number of topics> <number of dimensions> <number of files>\n" )
	quit()

# get input
directory  = sys.argv[ 1 ]
topics     = int( sys.argv[ 2 ] )
dimensions = int( sys.argv[ 3 ] )
files      = int( sys.argv[ 4 ] )

# initialize
filenames  = sorted( [ os.path.join( directory, filename ) for filename in os.listdir( directory ) ] )
vectorizer = TfidfVectorizer( input = 'filename', max_df = 0.95, min_df = 2, stop_words = 'english' )

# vectorize and create a model against the corpus; extract the features
tfidf    = vectorizer.fit_transform( filenames )
model    = NMF( n_components=topics, random_state=1 ).fit( tfidf )
features = vectorizer.get_feature_names()

# process each topic in the model
for item, topic in enumerate( model.components_ ) :
	
	# output most significant topic word(s)
	i = 0
	print( '  * ' + "; ".join( [ features[ i ] for i in topic.argsort()[ :-dimensions - 1:-1 ] ] ) )
	
	# output file names ordered by significance with the given feature, "Thanks Jason Thomale!"
	scores    = tfidf.getcol( i ).toarray().tolist() 
	documents = [ ( item[ 0 ], item[ 1 ] ) for item in enumerate( scores ) ]
	rankings  = sorted( documents, key=lambda x: x[ 1 ], reverse=True )
	for r in range( 0, files ) :
		print( '    o ' + filenames[ rankings[ r ][ 0 ] ] )
	
	# delimit
	print()

# done
exit()
