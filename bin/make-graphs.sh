#!/bin/bash

# make-graphs.sh - assuming R (and all of its friends) is installed, create some charts

# Eric Lease Morgan <emorgan@nd.edu>
# May 30, 2015 - first cut; brain dead
# June 2, 2015 - added sanity checking
# June 4, 2015 - added graph-catalog.R (creeping featuritis!)


# get input
NAME=$1

# sanity check
if [ -z $NAME ]; then

    echo "Usage: $0 <name>"
    exit 1
    
fi

# do the work
./bin/graph-cluster.R $NAME
./bin/graph-wordcloud.R $NAME
./bin/graph-catalog.R $NAME

# done
exit 0


