#!/bin/bash

# build-corpus.sh - given an rsync shell script and a keyword, cache HathiTrust content and make it browsable

# Eric Lease Morgan <emorgan@nd.edu>
# May 21, 2015 - first investigations
# May 31, 2015 - added charting (oops!) as well as pretty about page; fifteen years ago today, Dad died
# June 2, 2015 - added sanity checking; removed need for rename command


# get input
NAME=$1
RSYNCSCRIPT=$2

# sanity check
if [ -z $NAME ] || [ -z $RSYNCSCRIPT ]; then

    echo "Usage: $0 <name> <rsync>"
    exit 1
    
fi


# stage #1 - set up the directory structure for the corpus
mkdir ./collections/$NAME
mkdir ./collections/$NAME/bz
mkdir ./collections/$NAME/json
mkdir ./collections/$NAME/index
mkdir ./collections/$NAME/text
mkdir ./collections/$NAME/graphs

# harvest the content
chmod +x $RSYNCSCRIPT
#cp $RSYNCSCRIPT $NAME/json
#cd $NAME/json
#RSYNCSCRIPT=$( basename $RSYNCSCRIPT )
#./$RSYNCSCRIPT
cd ./collections/$NAME/bz
../../../$RSYNCSCRIPT
cd ../../..

# get rid of "advanced" files, uncompress everything, and rename the balance
#rm *.advanced.*
find ./collections/$NAME/bz -name "*.bz2" -exec cp {} ./collections/$NAME/json \;
bunzip2 ./collections/$NAME/json/*.bz2
rm ./collections/$NAME/json/*.bz2

# stage #2 - create the index
#cd ../..
#./bin/make-index.sh $NAME
find ./collections/$NAME/json -name '*.json' | parallel ./bin/make-index.sh $NAME {}


# make dictionary
./bin/make-dictionary.py ./collections/$NAME/index/ > ./collections/$NAME/dictionary.db

# extract unique words
cat ./collections/$NAME/dictionary.db | ./bin/list-unique.py  > ./collections/$NAME/unique.db


# stage #3 - create the catalog
./bin/make-catalog.sh $NAME

# stage #4 - create sorted numeric reports
./bin/calculate-size.sh   ./collections/$NAME                      | sort -k2 -n -r > ./collections/$NAME/sizes.db
./bin/calculate-themes.sh ./collections/$NAME etc/theme-colors.txt | sort -k2 -g -r > ./collections/$NAME/calculated-colors.db
./bin/calculate-themes.sh ./collections/$NAME etc/theme-names.txt  | sort -k2 -g -r > ./collections/$NAME/calculated-names.db
./bin/calculate-themes.sh ./collections/$NAME etc/theme-ideas.txt  | sort -k2 -g -r > ./collections/$NAME/calculated-ideas.db

# create reports, sorted by coefficient: colors, names, ideas
./bin/calculate-themes.py -v ./collections/$NAME/dictionary.db etc/theme-colors.txt > ./collections/$NAME/dictionary-colors.db
./bin/calculate-themes.py -v ./collections/$NAME/dictionary.db etc/theme-names.txt  > ./collections/$NAME/dictionary-names.db
./bin/calculate-themes.py -v ./collections/$NAME/dictionary.db etc/theme-ideas.txt  > ./collections/$NAME/dictionary-ideas.db

# create charts; R needs to be installed (oops!); commented out so people don't need R, yet
./bin/make-graphs.sh ./collections/$NAME

# state 5 - analyze corpus and create pretty about page
./bin/about.sh ./collections/$NAME > ./collections/$NAME/about.db
./bin/about2html.py ./collections/$NAME > ./collections/$NAME/about.html

# stage 6 - done
exit 0


