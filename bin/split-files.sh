#!/bin/bash

# initialize
FILE=$1
DIRECTORY=$2
TMP='/home/dcuser/text-analysis-htrc/tmp'
BASE=$( basename $FILE .txt )

cat $FILE | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\n/g' > "$TMP/$BASE.tmp"
cd $DIRECTORY
csplit --quiet "$TMP/$BASE.tmp" /\n/ {*} --prefix="$BASE-" --suffix-format="%05d.txt"
rm "$TMP/$BASE.tmp"
