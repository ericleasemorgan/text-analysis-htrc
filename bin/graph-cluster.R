#!/usr/bin/env Rscript

# cluster.R - given a source directory, output a cluster dendrogram illustrating how the documents are grouped

# Eric Lease Morgan <emorgan@nd.edu>
# May 26, 2015 - first investigations
# May 27, 2015 - at the cabin, and got first output
# June 4, 2015 - moved output to the graphs directory


# configure
SPARSITY  = 0.5
COLORS    = './etc/theme-colors.txt'
NAMES     = './etc/theme-names.txt'
IDEAS     = './etc/theme-ideas.txt'
TEXT      = '/text/'
GRAPHS    = '/graphs/'

# require
library( NLP )
library( tm )

# name
name = commandArgs( trailingOnly = TRUE )

# based on the command line input, create a corpus
corpus <- VCorpus( DirSource( paste( name, TEXT, sep='' ) ) )

# create assocated document term matrixes: sparse, colors, names, and ideas
frequent <- removeSparseTerms( DocumentTermMatrix( corpus ), SPARSITY )
colors   <- DocumentTermMatrix( corpus, list( dictionary = as.character( read.table( COLORS, header=F )$V1 ) ) )
names    <- DocumentTermMatrix( corpus, list( dictionary = as.character( read.table( NAMES,  header=F )$V1 ) ) )
ideas    <- DocumentTermMatrix( corpus, list( dictionary = as.character( read.table( IDEAS,  header=F )$V1 ) ) )

# output the dendrograms; frequent 
png( filename = paste( name, GRAPHS, "/cluster-frequent.png", sep='' ) )
plot( hclust( dist( frequent ) ), main='Clustering via frequent words' )

# colors
png( filename = paste( name, GRAPHS, "/cluster-colors.png", sep='' ) )
plot( hclust( dist( colors ) ), main='Clustering via color words' )

# names
png( filename = paste( name, GRAPHS, "/cluster-names.png", sep='' ) )
plot( hclust( dist( names ) ), main='Clustering via "big" names' )

# ideas
png( filename = paste( name, GRAPHS, "/cluster-ideas.png", sep='' ) )
plot( hclust( dist( ideas ) ), main='Clustering via "great" ideas' )


