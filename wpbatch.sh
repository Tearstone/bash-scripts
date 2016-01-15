#!/bin/bash

# Batch process URLs to use in wpscan

DATA="$1"
LIST=($(cat ./$DATA))

if [ -s $LIST ]; then
echo "Dataset is empty"
else
echo "Checking for updates"
wpscan --update > /dev/null
for i in "${LIST[@]}"
do
     echo "Testing " $i
     wpscan -u $i --follow-redirection -f >> results.txt
done
fi
