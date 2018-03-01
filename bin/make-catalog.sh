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
./bin/make-catalog.py ./collections/$NAME/ | sort > ./collections/$NAME/catalog.db

# append: sizes, colors, names, ideas
./bin/calculate-size.sh   ./collections/$NAME                      | sort | cut -f2 | paste ./collections/$NAME/catalog.db - > ./collections/$NAME/catalog.tmp; mv ./collections/$NAME/catalog.tmp ./collections/$NAME/catalog.db
./bin/calculate-themes.sh ./collections/$NAME etc/theme-colors.txt | sort | cut -f2 | paste ./collections/$NAME/catalog.db - > ./collections/$NAME/catalog.tmp; mv ./collections/$NAME/catalog.tmp ./collections/$NAME/catalog.db
./bin/calculate-themes.sh ./collections/$NAME etc/theme-names.txt  | sort | cut -f2 | paste ./collections/$NAME/catalog.db - > ./collections/$NAME/catalog.tmp; mv ./collections/$NAME/catalog.tmp ./collections/$NAME/catalog.db
./bin/calculate-themes.sh ./collections/$NAME etc/theme-ideas.txt  | sort | cut -f2 | paste ./collections/$NAME/catalog.db - > ./collections/$NAME/catalog.tmp; mv ./collections/$NAME/catalog.tmp ./collections/$NAME/catalog.db

# add the human-readable header
printf "id\ttitle\tpublication date\tpage count\tHathiTrust URL\tlanguage\tMARC URL\tWorldCat URL\tsize in words\tcolor coefficient\tname coefficient\tideas coefficient\n" | cat - ./collections/$NAME/catalog.db > ./collections/$NAME/catalog.tmp; mv ./collections/$NAME/catalog.tmp ./collections/$NAME/catalog.db

# make the human-readable version
./bin/catalog2html.py ./collections/$NAME > ./collections/$NAME/catalog.html

# make the search engine, as it may be, available
cp ./etc/search.cgi ./collections/$NAME
chmod +x ./collections/$NAME/search.cgi

# done
exit 0



