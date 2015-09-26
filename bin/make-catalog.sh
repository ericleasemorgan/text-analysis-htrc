#!/bin/bash

# make-catalog.sh - given a name, create a "database" from the previously gathered information

# Eric Lease Morgan <emorgan@nd.edu>
# May 23, 2015 - first cut
# May 30, 2015 - added human-readable version to output
# June 2, 2015 - added sanity checking; removed json configuration


# get input
NAME=$1

# sanity check
if [ -z $NAME ]; then

    echo "Usage: $0 <name>"
    exit 1
    
fi

# initialize the database with the content from the json files
./bin/make-catalog.py $NAME/ | sort > $NAME/catalog.db

# append: sizes, colors, names, ideas
./bin/calculate-size.sh   $NAME                      | sort | cut -f2 | paste $NAME/catalog.db - > $NAME/catalog.tmp; mv $NAME/catalog.tmp $NAME/catalog.db
./bin/calculate-themes.sh $NAME etc/theme-colors.txt | sort | cut -f2 | paste $NAME/catalog.db - > $NAME/catalog.tmp; mv $NAME/catalog.tmp $NAME/catalog.db
./bin/calculate-themes.sh $NAME etc/theme-names.txt  | sort | cut -f2 | paste $NAME/catalog.db - > $NAME/catalog.tmp; mv $NAME/catalog.tmp $NAME/catalog.db
./bin/calculate-themes.sh $NAME etc/theme-ideas.txt  | sort | cut -f2 | paste $NAME/catalog.db - > $NAME/catalog.tmp; mv $NAME/catalog.tmp $NAME/catalog.db

# add the human-readable header
printf "id\ttitle\tpublication date\tpage count\tHathiTrust URL\tlanguage\tMARC URL\tWorldCat URL\tsize in words\tcolor coefficient\tname coefficient\tideas coefficient\n" | cat - $NAME/catalog.db > $NAME/catalog.tmp; mv $NAME/catalog.tmp $NAME/catalog.db

# make the human-readable version
./bin/catalog2html.py $NAME > $NAME/catalog.html

# make the search engine, as it may be, available
cp ./etc/search.cgi $NAME
chmod +x $NAME/search.cgi

# done
exit 0


