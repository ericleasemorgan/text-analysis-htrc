#!/bin/bash

# build-corpus.sh - given an rsync shell script and a keyword, cache HathiTrust content and make it browsable

# Eric Lease Morgan <emorgan@nd.edu>
# May 21, 2015 - first investigations
# May 31, 2015 - added charting (oops!) as well as pretty about page; fifteen years ago today, Dad died
# June 2, 2015 - added sanity checking; removed need for rename command
# January 8, 2016 - made it work from CGI; riding the train to Boston!


# get input
NAME=$1
RSYNCSCRIPT=$2

# sanity check
if [ -z $NAME ] || [ -z $RSYNCSCRIPT ]; then

    echo "Usage: $0 <name> <rsync>"
    exit 1
    
fi


# stage #1 - set up the directory structure for the corpus
echo "Making directory structure"
mkdir $NAME
mkdir $NAME/json
mkdir $NAME/index
mkdir $NAME/text
mkdir $NAME/graphs

# harvest the content
echo "Harvesting content"
chmod +x $RSYNCSCRIPT
cp $RSYNCSCRIPT $NAME/json
cd $NAME/json
RSYNCSCRIPT=$( basename $RSYNCSCRIPT )
/bin/bash ./$RSYNCSCRIPT

# get rid of "advanced" files, uncompress everything, and rename the balance
echo "Removing cruft and uncompressing files"
rm *.advanced.*
bunzip2 *.bz2
for f in *.basic.json; do mv $f ${f//basic\.json}json ; done


# stage #2 - create the index
echo "Indexing content"
cd ../..
./bin/make-index.sh $NAME

# make dictionary
echo "Making dictionary"
./bin/make-dictionary.py $NAME/index/ > $NAME/dictionary.db

# extract unique words
echo "Extracting unique words"
cat $NAME/dictionary.db | ./bin/list-unique.py  > $NAME/unique.db


# stage #3 - create the catalog
echo "Building the catalog"
./bin/make-catalog.sh $NAME


# stage #4 - create sorted numeric reports
echo "Creating sorted numeric reports"
./bin/calculate-size.sh   $NAME                      | sort -k2 -n -r > $NAME/sizes.db
./bin/calculate-themes.sh $NAME etc/theme-colors.txt | sort -k2 -g -r > $NAME/calculated-colors.db
./bin/calculate-themes.sh $NAME etc/theme-names.txt  | sort -k2 -g -r > $NAME/calculated-names.db
./bin/calculate-themes.sh $NAME etc/theme-ideas.txt  | sort -k2 -g -r > $NAME/calculated-ideas.db

# create reports, sorted by coefficient: colors, names, ideas
echo "Creating reports sorted by coefficients"
./bin/calculate-themes.py -v $NAME/dictionary.db etc/theme-colors.txt > $NAME/dictionary-colors.db
./bin/calculate-themes.py -v $NAME/dictionary.db etc/theme-names.txt  > $NAME/dictionary-names.db
./bin/calculate-themes.py -v $NAME/dictionary.db etc/theme-ideas.txt  > $NAME/dictionary-ideas.db

# create charts; R needs to be installed (oops!); commented out so people don't need R, yet
echo "Building graphs"
./bin/make-graphs.sh $NAME


# state 5 - analyze corpus and create pretty about page
echo "Analyzing corpus and creating about page"
./bin/about.sh $NAME > $NAME/about.db
./bin/about2html.py $NAME > $NAME/about.html


# stage 6 - update list (database) of collections
echo "Updating database"
./bin/update-db.sh $NAME


# stage 7 - done
echo "Done"
exit 0


