#!/bin/bash

# build-corpus.cgi - via CGI and given an rsync shell script and a keyword, cache HathiTrust content and make it browsable

# Eric Lease Morgan <emorgan@nd.edu>
# December 27, 2015 - based on build-corpus.sh, and got it to work after sudo setsebool httpd_can_network_connect on. "Thank you, Michael Berkowski!"


# print the magic lines and start output
echo "Content-type: text/plain"
echo
echo "Building corpus"

# configure
ROOT=/var/www/html/hathitrust
NAME=lancaster
RSYNCSCRIPT=etc/rsync-lancaster.sh

# stage #1 - initialize the directory structure for the corpus
cd $ROOT
rm -rf $NAME
mkdir $NAME
mkdir $NAME/json
mkdir $NAME/index
mkdir $NAME/text
mkdir $NAME/graphs

# harvest the content
chmod +x $RSYNCSCRIPT
cp $RSYNCSCRIPT $NAME/json
cd $NAME/json
RSYNCSCRIPT=$( basename $RSYNCSCRIPT )
/bin/bash ./$RSYNCSCRIPT

# get rid of "advanced" files, uncompress everything, and rename the balance
rm *.advanced.*
bunzip2 *.bz2
for f in *.basic.json; do mv $f ${f//basic\.json}json ; done


# stage #2 - create the index
cd ../..
./bin/make-index.sh $NAME

# make dictionary
./bin/make-dictionary.py $NAME/index/ > $NAME/dictionary.db

# extract unique words
cat $NAME/dictionary.db | ./bin/list-unique.py  > $NAME/unique.db


# stage #3 - create the catalog
./bin/make-catalog.sh $NAME


# stage #4 - create sorted numeric reports
./bin/calculate-size.sh   $NAME                      | sort -k2 -n -r > $NAME/sizes.db
./bin/calculate-themes.sh $NAME etc/theme-colors.txt | sort -k2 -g -r > $NAME/calculated-colors.db
./bin/calculate-themes.sh $NAME etc/theme-names.txt  | sort -k2 -g -r > $NAME/calculated-names.db
./bin/calculate-themes.sh $NAME etc/theme-ideas.txt  | sort -k2 -g -r > $NAME/calculated-ideas.db

# create reports, sorted by coefficient: colors, names, ideas
./bin/calculate-themes.py -v $NAME/dictionary.db etc/theme-colors.txt > $NAME/dictionary-colors.db
./bin/calculate-themes.py -v $NAME/dictionary.db etc/theme-names.txt  > $NAME/dictionary-names.db
./bin/calculate-themes.py -v $NAME/dictionary.db etc/theme-ideas.txt  > $NAME/dictionary-ideas.db

# create charts; R needs to be installed (oops!); commented out so people don't need R, yet
./bin/make-graphs.sh $NAME


# state 5 - analyze corpus and create pretty about page
./bin/about.sh $NAME > $NAME/about.db
./bin/about2html.py $NAME > $NAME/about.html


# stage 6 - done
echo "Done."
exit 0


