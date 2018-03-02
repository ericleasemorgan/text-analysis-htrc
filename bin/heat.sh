#!/bin/bash

# heat.sh - given a directory, number of topics, and number of dimensions, illustrate how the topics are dispersed in a corpus
# See --> https://de.dariah.eu/tatom/topic_model_mallet.html

# Eric Lease Morgan <emorgan@nd.edu>
# October 17, 2017 - first cut; needs error checking


# configure
ROOT='/home/dcuser/text-analysis-htrc'
MALLET="/opt/applications/mallet-2.0.8"
MODEL="$ROOT/tmp/data.mallet"
TOPICS="$ROOT/tmp/topics.txt"
KEYS="$ROOT/tmp/keys.txt"
HEAT="$ROOT/bin/heat.py"

# create the model/database
$MALLET/bin/mallet import-dir --input $1 --output $MODEL --keep-sequence --remove-stopwords

# do the work
$MALLET/bin/mallet train-topics --input $MODEL --num-topics $2 --output-doc-topics $TOPICS --output-topic-keys $KEYS --num-top-words $3 --random-seed 1 --num-iterations 100 --num-threads 2

# visualize
$HEAT $1 $TOPICS

# done
exit
