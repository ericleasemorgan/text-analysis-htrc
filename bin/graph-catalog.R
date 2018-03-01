#!/usr/bin/env Rscript

# graph-catalog.R - given the name of a collection, literally illustrate characteristics of the catalog

# Eric Lease Morgan <emorgan@nd.edu>
# June 3, 2015 - first investigations


# configure
CATALOG = '/catalog.db'
GRAPHS  = '/graphs/'

# get input
name = commandArgs( trailingOnly = TRUE )

# read and parse
catalog =  read.table( paste( name, CATALOG, sep='' ), sep='\t', header=T, quote = '' )
dates   <- catalog$publication.date
pages   <- catalog$page.count
words   <- catalog$size.in.words
colors  <- catalog$color.coefficient
names   <- catalog$name.coefficient
ideas   <- catalog$ideas.coefficient

# create a matrix of scatter plots
png( filename = ( paste( name, GRAPHS, 'catalog-scatterplot.png', sep='' ) ) )
pairs(~dates+pages+words+colors+names+ideas, data=catalog, main="Scatterplot Matrix")

# create boxplots and histograms for each of the numeric columns; dates
png( filename = ( paste( name, GRAPHS, 'catalog-boxplot-dates.png', sep='' ) ) )
boxplot( dates, main="Dates")
png( filename = ( paste( name, GRAPHS, 'catalog-histogram-dates.png', sep='' ) ) )
hist( dates, freq=FALSE, main="Dates")
curve( dnorm( x, mean=mean( dates ), sd=sd( dates ) ), add=TRUE, col="darkblue", lwd=2 )

# pages
png( filename = ( paste( name, GRAPHS, 'catalog-boxplot-pages.png', sep='' ) ) )
boxplot( pages, main="Pages")
png( filename = ( paste( name, GRAPHS, 'catalog-histogram-pages.png', sep='' ) ) )
hist( pages, freq=FALSE, main="Pages")
curve( dnorm( x, mean=mean( pages ), sd=sd( pages ) ), add=TRUE, col="darkblue", lwd=2 )

# words
png( filename = ( paste( name, GRAPHS, 'catalog-boxplot-words.png', sep='' ) ) )
boxplot( words, main="Words")
png( filename = ( paste( name, GRAPHS, 'catalog-histogram-words.png', sep='' ) ) )
hist( words, freq=FALSE, main="Words")
curve( dnorm( x, mean=mean( words ), sd=sd( words ) ), add=TRUE, col="darkblue", lwd=2 )

# colors
png( filename = ( paste( name, GRAPHS, 'catalog-boxplot-colors.png', sep='' ) ) )
boxplot( colors, main="Colors")
png( filename = ( paste( name, GRAPHS, 'catalog-histogram-colors.png', sep='' ) ) )
hist( colors, freq=FALSE, main="Colors")
curve( dnorm( x, mean=mean( colors ), sd=sd( colors ) ), add=TRUE, col="darkblue", lwd=2 )

# names
png( filename = ( paste( name, GRAPHS, 'catalog-boxplot-names.png', sep='' ) ) )
boxplot( names, main="'Big' names")
png( filename = ( paste( name, GRAPHS, 'catalog-histogram-names.png', sep='' ) ) )
hist( names, freq=FALSE, main="'Big' names")
curve( dnorm( x, mean=mean( names ), sd=sd( names ) ), add=TRUE, col="darkblue", lwd=2 )

# ideas
png( filename = ( paste( name, GRAPHS, 'catalog-boxplot-ideas.png', sep='' ) ) )
boxplot( ideas, main="'Great' ideas")
png( filename = ( paste( name, GRAPHS, 'catalog-histogram-ideas.png', sep='' ) ) )
hist( ideas, freq=FALSE, main="'Great' ideas")
curve( dnorm( x, mean=mean( ideas ), sd=sd( ideas ) ), add=TRUE, col="darkblue", lwd=2 )

