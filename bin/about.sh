#!/bin/bash

# about.sh - create a set of name/value pairs describing a corpus

# Eric Lease Morgan <emorgan@nd.edu>
# May 31, 2015 - first investigations; based on previous work
# June 2, 2015 - added sanity check; removed some Linux-isms


# get input
CORPUSNAME=$1

# sanity check
if [ -z $CORPUSNAME ]; then

    echo "Usage: $0 <name>"
    exit 1
    
fi

# size of corpus
CORPUSSIZE=$( ls -1 $CORPUSNAME/json/*.json | wc -l )

# slurp up the catalog and remove its header
CATALOG=$( sed '1d' $CORPUSNAME/catalog.db )

# remember, the fields in the (default) catalog
#   1 - id
#   2 - title
#   3 - publication date
#   4 - size in pages
#   5 - HathiTrust URL
#   6 - language
#   7 - MARC URL
#   8 - WorldCat URL
#   9 - size in words
#  10 - colors coefficient
#  11 - names coefficient
#  12 - ideas coefficient

# date range
DATEEARLIEST=$( echo "$CATALOG" | sort -t $'\t' -k3 -g    | cut -f3 | head -1 )
DATELATEST=$(   echo "$CATALOG" | sort -t $'\t' -k3 -g -r | cut -f3 | head -1 )

# size in page
PAGESSHORTEST=$(echo "$CATALOG" | sort -t $'\t' -k4 -g    | cut -f4 | head -1 )
PAGESLONGEST=$( echo "$CATALOG" | sort -t $'\t' -k4 -g -r | cut -f4 | head -1 )
PAGESTOTAL=$(   echo "$CATALOG" | cut -f4 | paste -sd+ -  | bc )

# size in words
WORDSSHORTEST=$(echo "$CATALOG" | sort -t $'\t' -k9 -n    | cut -f9 | head -1 )
WORDSLONGEST=$( echo "$CATALOG" | sort -t $'\t' -k9 -n -r | cut -f9 | head -1 )
WORDSTOTAL=$(   echo "$CATALOG" | cut -f9 | paste -sd+ - | bc )
WORDSUNIQUE=$(    wc -l < $CORPUSNAME/unique.db | tr -d ' ' )

# most frequent words
FREQUENTWORDS=$( cat $CORPUSNAME/dictionary.db        | head -25 | awk '{print $1" "$2}' | tr '\n' '|' )
FREQUENTIDEAS=$( cat $CORPUSNAME/dictionary-ideas.db  | head -25 | awk '{print $1" "$2}' | tr '\n' '|' )
FREQUENTNAMES=$( cat $CORPUSNAME/dictionary-names.db  | head -25 | awk '{print $1" "$2}' | tr '\n' '|' )
FREQUENTCOLORS=$(cat $CORPUSNAME/dictionary-colors.db | head -10 | awk '{print $1" "$2}' | tr '\n' '|' )

# items of interest
WORKSHORTEST=$( echo "$CATALOG" | sort -t $'\t' -k4  -g    | head -1 | cut -f1 )
WORKLONGEST=$(  echo "$CATALOG" | sort -t $'\t' -k4  -g -r | head -1 | cut -f1 )
WORKOLDEST=$(   echo "$CATALOG" | sort -t $'\t' -k3  -g    | head -1 | cut -f1 )
WORKNEWEST=$(   echo "$CATALOG" | sort -t $'\t' -k3  -g -r | head -1 | cut -f1 )
IDEASMOST=$(    echo "$CATALOG" | sort -t $'\t' -k12 -g -r | head -1 | cut -f1 )
IDEASLEAST=$(   echo "$CATALOG" | sort -t $'\t' -k12 -g    | head -1 | cut -f1 )
NAMESMOST=$(    echo "$CATALOG" | sort -t $'\t' -k11 -g -r | head -1 | cut -f1 )
NAMESLEAST=$(   echo "$CATALOG" | sort -t $'\t' -k11 -g    | head -1 | cut -f1 )
COLORSMOST=$(   echo "$CATALOG" | sort -t $'\t' -k10 -g -r | head -1 | cut -f1 )
COLORSLEAST=$(  echo "$CATALOG" | sort -t $'\t' -k10 -g    | head -1 | cut -f1 )

# output
printf "CORPUSNAME\t$CORPUSNAME\n"
printf "CORPUSSIZE\t$CORPUSSIZE\n"
printf "DATEEARLIEST\t$DATEEARLIEST\n"
printf "DATELATEST\t$DATELATEST\n"
printf "PAGESSHORTEST\t$PAGESSHORTEST\n"
printf "PAGESLONGEST\t$PAGESLONGEST\n"
printf "PAGESTOTAL\t$PAGESTOTAL\n"
printf "WORDSSHORTEST\t$WORDSSHORTEST\n"
printf "WORDSLONGEST\t$WORDSLONGEST\n"
printf "WORDSTOTAL\t$WORDSTOTAL\n"
printf "WORDSUNIQUE\t$WORDSUNIQUE\n"
printf "FREQUENTWORDS\t$FREQUENTWORDS\n"
printf "FREQUENTIDEAS\t$FREQUENTIDEAS\n"
printf "FREQUENTNAMES\t$FREQUENTNAMES\n"
printf "FREQUENTCOLORS\t$FREQUENTCOLORS\n"
printf "WORKSHORTEST\t$WORKSHORTEST\n"
printf "WORKLONGEST\t$WORKLONGEST\n"
printf "WORKOLDEST\t$WORKOLDEST\n"
printf "WORKNEWEST\t$WORKNEWEST\n"
printf "IDEASMOST\t$IDEASMOST\n"
printf "IDEASLEAST\t$IDEASLEAST\n"
printf "NAMESMOST\t$NAMESMOST\n"
printf "NAMESLEAST\t$NAMESLEAST\n"
printf "COLORSMOST\t$COLORSMOST\n"
printf "COLORSLEAST\t$COLORSLEAST\n"

# done
exit


